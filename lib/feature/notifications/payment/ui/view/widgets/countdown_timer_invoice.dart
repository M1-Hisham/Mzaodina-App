import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

class CountdownTimerInvoice extends StatefulWidget {
  final Duration initialDuration;

  const CountdownTimerInvoice({super.key, required this.initialDuration});

  @override
  State<CountdownTimerInvoice> createState() => _CountdownTimerInvoiceState();
}

class _CountdownTimerInvoiceState extends State<CountdownTimerInvoice> {
  late Duration _remainingTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.initialDuration;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime.inSeconds > 0) {
          _remainingTime = _remainingTime - const Duration(seconds: 1);
        } else {
          _timer?.cancel();
          // يمكنك إضافة أي عمل تريد تنفيذه عند انتهاء المؤقت هنا
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
    _timer?.cancel();
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
