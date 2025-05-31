import 'package:flutter/material.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

class CustomErorrWidget extends StatelessWidget {
  final String message;
  final Future<void> Function() onRefresh;
  const CustomErorrWidget({
    super.key,
    required this.message,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message, style: R.textStyles.font18primaryW500Light),
              Text(
                'اسحب لاسفل لعمل ريفريش',
                style: R.textStyles.font18primaryW500Light,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
