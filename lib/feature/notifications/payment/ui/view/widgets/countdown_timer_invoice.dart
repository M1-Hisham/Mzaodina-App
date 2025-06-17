import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/web-socket/cubit/web_socket_cubit.dart';

class CountdownTimerInvoice extends StatefulWidget {
  final DateTime expiresAt;

  const CountdownTimerInvoice({super.key, required this.expiresAt});

  @override
  State<CountdownTimerInvoice> createState() => _CountdownTimerInvoiceState();
}

class _CountdownTimerInvoiceState extends State<CountdownTimerInvoice>
    with WidgetsBindingObserver {
  Timer? _timer;
  Duration _remainingTime = Duration.zero;
  WebSocketCubit? _webSocketCubit;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _webSocketCubit = context.read<WebSocketCubit>();
    _startTimer();
  }

  void _startTimer() {
    _calculateRemainingTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _calculateRemainingTime();
    });
  }

  void _calculateRemainingTime() {
    final now = _webSocketCubit?.getCurrentServerTime() ?? DateTime.now();
    final diff = widget.expiresAt.difference(now);
    setState(() {
      _remainingTime = diff.isNegative ? Duration.zero : diff;
    });

    // ✅ لو الوقت خلص وما تنقلناش قبل كده
    if (_remainingTime == Duration.zero && !_hasNavigated) {
      _hasNavigated = true;

      // ✅ ننتظر ثواني قليلة للتأكد أن السيرفر فعلاً بعت وقت منتهي
      Future.delayed(const Duration(seconds: 3), () {
        final confirmedNow =
            _webSocketCubit?.getCurrentServerTime() ?? DateTime.now();
        final confirmedDiff = widget.expiresAt.difference(confirmedNow);
        final confirmedRemaining =
            confirmedDiff.isNegative ? Duration.zero : confirmedDiff;

        if (confirmedRemaining == Duration.zero) {
          // ✅ انتقل للصفحة المطلوبة (مثلاً HomeScreen)
          Navigator.of(context).pushNamedAndRemoveUntil(
            '/HomeScreen', // غيرها للمسار المناسب
            (route) => false,
          );
        } else {
          // ⏳ رجّع حالة التنقل لو ما انتهاش فعليًا
          _hasNavigated = false;
        }
      });
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _webSocketCubit?.connect();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_remainingTime == Duration.zero) {
      return Text(
        '⏰ انتهى الوقت',
        style: R.textStyles.font16primaryW600Light.copyWith(color: Colors.red),
      );
    }

    return Text(
      _formatDuration(_remainingTime),
      style: R.textStyles.font16primaryW600Light,
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}
