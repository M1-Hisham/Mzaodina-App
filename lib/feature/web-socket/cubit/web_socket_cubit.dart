import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'web_socket_state.dart';

class WebSocketCubit extends Cubit<WebSocketState> {
  static WebSocketCubit? _instance;
  WebSocketChannel? _channel;
  Timer? _keepAliveTimer;
  String? latestServerTime;
  bool _isConnecting = false;

  WebSocketCubit._() : super(WebSocketInitial()) {
    _connect();
  }

  factory WebSocketCubit() {
    _instance ??= WebSocketCubit._();
    return _instance!;
  }

  bool get isConnected => _channel != null && _channel!.closeCode == null;

  void connect() {
    if (!isConnected && !_isConnecting) {
      _connect();
    }
  }

  void _connect() {
    if (_isConnecting) return;
    _isConnecting = true;

    log('📨 Initializing WebSocketCubit...');

    try {
      // Close previous connection if exists
      _channel?.sink.close();

      _channel = WebSocketChannel.connect(
        Uri.parse(
          'wss://mzaodin.com/app/k5n849mwzstmvbgppimp?protocol=7&client=js&version=7.0.3&flash=false',
        ),
      );

      _keepAliveTimer?.cancel();
      _keepAliveTimer = Timer.periodic(Duration(seconds: 50), (_) {
        if (_channel?.closeCode == null) {
          _channel!.sink.add(jsonEncode({"event": "ping"}));
          log('🔁 Sent ping');
        }
      });

      _channel!.stream.listen(
        (event) {
          try {
            final data = jsonDecode(event);
            final eventType = data['event'];
            final eventData = data['data'];

            log('📨 Event: $eventType');
            log('📦 Data: $eventData');

            Map<String, dynamic>? decodedData;
            try {
              decodedData =
                  eventData is String && eventData.trim().isNotEmpty
                      ? jsonDecode(eventData)
                      : null;
            } catch (_) {
              decodedData = null;
            }

            if (eventType == 'pusher:connection_established') {
              _channel!.sink.add(jsonEncode({
                "event": "pusher:subscribe",
                "data": {"channel": "server-time"},
              }));
              log('✅ Subscribed to server-time channel');
            }

            if (eventType == 'App\\Events\\ServerTimeUpdated' &&
                decodedData != null) {
              final serverTime = decodedData['server_time'];
              latestServerTime = serverTime;
              emit(WebSocketServerTimeUpdated(serverTime));
            }
          } catch (e) {
            log('⚠️ Error decoding message: $e');
            emit(WebSocketError('Invalid message format'));
            _reconnect();
          }
        },
        onError: (error) {
          log('❌ WebSocket error: $error');
          emit(WebSocketError(error.toString()));
          _reconnect();
        },
        onDone: () {
          log('🔌 WebSocket closed');
          emit(WebSocketDone('WebSocket connection closed'));
          _reconnect();
        },
      );

      _isConnecting = false;
      log('✅ WebSocketCubit initialized');
    } catch (e) {
      _isConnecting = false;
      log('❌ Error connecting to WebSocket: $e');
      emit(WebSocketError('Failed to connect to WebSocket'));
      _reconnect();
    }
  }

  void _reconnect() {
    Future.delayed(Duration(seconds: 5), () {
      if (_channel?.closeCode != null) {
        log('🔁 Reconnecting...');
        _connect();
      }
    });
  }

  DateTime getCurrentServerTime() {
    try {
      return latestServerTime != null
          ? DateTime.parse(latestServerTime!)
          : DateTime.now();
    } catch (_) {
      return DateTime.now();
    }
  }

  @override
  Future<void> close() {
    _keepAliveTimer?.cancel();
    _channel?.sink.close();
    _instance = null;
    return super.close();
  }
}
