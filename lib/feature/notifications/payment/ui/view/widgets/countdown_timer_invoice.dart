import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/web-socket/cubit/web_socket_cubit.dart';
import 'package:mzaodina_app/feature/web-socket/cubit/web_socket_state.dart';

class CountdownTimerInvoice extends StatelessWidget {
  final DateTime expiresAt;

  const CountdownTimerInvoice({super.key, required this.expiresAt});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WebSocketCubit, WebSocketState>(
      builder: (context, state) {
        final webSocketCubit = WebSocketCubit();
        final now = webSocketCubit.getCurrentServerTime();
        final diff = expiresAt.difference(now);
        final remainingTime = diff.isNegative ? Duration.zero : diff;

        return Text(
          _formatDuration(remainingTime),
          style: R.textStyles.font16primaryW600Light,
        );
      },
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final totalMinutes = duration.inMinutes;
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$totalMinutes:$seconds';
  }
}
