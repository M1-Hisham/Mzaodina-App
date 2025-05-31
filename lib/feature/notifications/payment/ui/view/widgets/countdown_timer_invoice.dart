import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

class CountdownTimerInvoice extends StatefulWidget {
  final DateTime expiresAt;

  const CountdownTimerInvoice({super.key, required this.expiresAt});

  @override
  State<CountdownTimerInvoice> createState() => _CountdownTimerInvoiceState();
}

class _CountdownTimerInvoiceState extends State<CountdownTimerInvoice> {
  late Timer _timer;
  late Duration _remainingTime;

  @override
  void initState() {
    super.initState();
    _calculateRemainingTime();
    _startTimer();
  }

  void _calculateRemainingTime() {
    final now = DateTime.now();
    final diff = widget.expiresAt.difference(now);
    _remainingTime = diff.isNegative ? Duration.zero : diff;
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _calculateRemainingTime();

        if (_remainingTime.inSeconds <= 0) {
          _timer.cancel();
        }
      });
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatDuration(_remainingTime),
      style: R.textStyles.font16primaryW600Light,
    );
  }
}
