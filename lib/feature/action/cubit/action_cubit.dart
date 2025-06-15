import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/action/model/actions_model.dart';
import 'package:mzaodina_app/feature/action/model/actionstatus_model.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'action_state.dart';

class ActionCubit extends Cubit<ActionState> {
  ActionCubit() : super(ActionLoadingStates());
  static ActionCubit get(context) => BlocProvider.of(context);

  WebSocketChannel? channel;
  // String auctionChannel = "auction.3";
  String btcUsdtPrice = "";
  MaxBid? maxBid;
  void connectToAuctionWebSocket({required String id}) {
    print("dddddddddddddfg");
    channel!.sink.close();

    emit(ActionLoadingStates());

    try {
      final uri = Uri.parse(
        "wss://mzaodin.com/app/k5n849mwzstmvbgppimp?protocol=7&client=js&version=7.0.3&flash=false",
      );

      channel = IOWebSocketChannel.connect(uri);

      if (channel == null) {
        emit(ActionErrorStates(error: 'فشل إنشاء اتصال.'));
        return;
      }

      final subscribePayload = {
        "event": "pusher:subscribe",
        "data": {"channel": "auction.$id"},
      };

      channel!.stream.listen(
        (message) {
          emit(ActionLoadingStates());

          try {
            final decoded = jsonDecode(message);
            final event = decoded["event"];
            final data = decoded["data"];

            if (event == "pusher:connection_established") {
              channel!.sink.add(jsonEncode(subscribePayload));
            }

            if (event == "pusher_internal:subscription_succeeded") {
              print(' تم الاشتراك بنجاح في القناة');
              return;
            }

            if (data != null && event != null) {
              final payload = jsonDecode(data);

              final maxBd = payload['auction']?['max_bid'];
              if (maxBd != null) {
                // print('[max_bid: $maxBd');
                maxBid = MaxBid.fromJson(maxBd);
                // print(' max_bid: ${maxBid!.user}');
                emit(ActionSuccessStates(actionStatusModel: maxBid!));
              } else {
                print(' لا يوجد max_bid في الرسالة');
              }
            }
          } catch (e) {
            print(' خطأ في تحليل البيانات: $e');
          }
        },
        onError: (error) {
          print(' خطأ في الاتصال: $error');
          emit(ActionErrorStates(error: error.toString()));
        },
        onDone: () {
          print(' تم إغلاق الاتصال، سيتم إعادة المحاولة...');
          Future.delayed(Duration(seconds: 3), () {
            connectToAuctionWebSocket(id: id);
          });
        },
      );
    } catch (e) {
      print(' استثناء غير متوقع: $e');
      emit(ActionErrorStates(error: 'حدث خطأ أثناء الاتصال: $e'));
    }
  }

  AuctionModel? auctionModel;
  String? auctionId = "";
  void auctionState({required String id, required String state}) {
    emit(ActionEventLoadingStates());

    try {
      final uri = Uri.parse(
        "wss://mzaodin.com/app/k5n849mwzstmvbgppimp?protocol=7&client=js&version=7.0.3&flash=false",
      );

      channel = IOWebSocketChannel.connect(uri);

      if (channel == null) {
        emit(ActionEventErrorStates(error: 'فشل إنشاء اتصال WebSocket.'));
        return;
      }

      final subscribePayload = {
        "event": "pusher:subscribe",
        "data": {"channel": "auction.$state.$id"},
      };

      channel!.stream.listen(
        (message) {
          emit(ActionEventLoadingStates());

          try {
            final decoded = jsonDecode(message);
            final event = decoded["event"];
            final data = decoded["data"];

            if (event == "pusher:connection_established") {
              channel!.sink.add(jsonEncode(subscribePayload));
            }

            if (event == "pusher_internal:subscription_succeeded") {
              print('[WebSocket] ✅ تم الاشتراك بنجاح في القناة');
              return;
            }

            if (data != null && event != null) {
              final payload = jsonDecode(data);

              final auction = payload['auction'];
              if (auction != null) {
                print('[WebSocket] ✅ DATA: $auction');
                auctionModel = AuctionModel.fromJson(auction);
                print('[WebSocket] ✅ max_bid: ${auctionModel!.auction}');
                emit(
                  ActionEventSuccessStates(actionStatusModel: auctionModel!),
                );
              } else {
                print('[WebSocket] ⚠️ لا يوجد max_bid في الرسالة');
              }
            }
          } catch (e) {
            print('[WebSocket] ❌ خطأ في تحليل البيانات: $e');
          }
        },
        onError: (error) {
          print('[WebSocket] ❌ خطأ في الاتصال: $error');
          emit(ActionEventErrorStates(error: error.toString()));
        },
        onDone: () {
          print('[WebSocket] ℹ️ تم إغلاق الاتصال، سيتم إعادة المحاولة...');
          Future.delayed(Duration(seconds: 3), () {
            connectToAuctionWebSocket(id: id);
          });
        },
      );
    } catch (e) {
      print('[WebSocket] ❌ استثناء غير متوقع: $e');
      emit(ActionEventErrorStates(error: 'حدث خطأ أثناء الاتصال: $e'));
    }
  }

  void actionsLoop({required List<String> ids, required String state}) {
    emit(ActionEventLoadingStates());
    print(ids);
    try {
      final uri = Uri.parse(
        "wss://mzaodin.com/app/k5n849mwzstmvbgppimp?protocol=7&client=js&version=7.0.3&flash=false",
      );

      channel = IOWebSocketChannel.connect(uri);

      if (channel == null) {
        emit(ActionEventErrorStates(error: 'فشل إنشاء اتصال WebSocket.'));
        return;
      }

      channel!.stream.listen(
        (message) {
          emit(ActionEventLoadingStates());

          try {
            final decoded = jsonDecode(message);
            final event = decoded["event"];
            final data = decoded["data"];

            if (event == "pusher:connection_established") {
              for (var id in ids) {
                final subscribePayload = {
                  "event": "pusher:subscribe",
                  "data": {"channel": "auction.$state.$id"},
                };
                channel!.sink.add(jsonEncode(subscribePayload));
              }

              debugPrint('✅ Subscribed to all auction channels');
            }

            if (event == "pusher_internal:subscription_succeeded") {
              print('[WebSocket] ✅ تم الاشتراك بنجاح في القناة');
              return;
            }

            if (data != null && event != null) {
              final payload = jsonDecode(data);

              final auction = payload['auction'];
              if (auction != null) {
                print('[WebSocket] ✅ DATA: $auction');
                auctionId = auction['id'];
                print(auctionId);
                auctionModel = AuctionModel.fromJson(payload);
                print('[WebSocket] ✅ auctionId: ${auctionModel!.auction}');
                emit(
                  ActionEventSuccessStates(actionStatusModel: auctionModel!),
                );
              } else {
                print('[WebSocket] ⚠️ لا يوجد max_bid في الرسالة');
              }
            }
          } catch (e) {
            print('[WebSocket] ❌ خطأ في تحليل البيانات: $e');
          }
        },
        onError: (error) {
          print('[WebSocket] ❌ خطأ في الاتصال: $error');
          emit(ActionEventErrorStates(error: error.toString()));
        },
        onDone: () {
          print('[WebSocket] ℹ️ تم إغلاق الاتصال، سيتم إعادة المحاولة...');
          Future.delayed(Duration(seconds: 3), () {
            actionsLoop(ids: ids, state: state);
          });
        },
      );
    } catch (e) {
      print('[WebSocket] ❌ استثناء غير متوقع: $e');
      emit(ActionEventErrorStates(error: 'حدث خطأ أثناء الاتصال: $e'));
    }
  }

  void disconnectWebSocket() {
    channel!.sink.close();
  }
}

// void getModel(onGoaingModel ongoingModel) {
//   ongoingModel.data.where((model) => model.id != auctionId);
//   emit(UpdateState);
// }
