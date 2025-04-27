import 'package:flutter/material.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_app_bar.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_tap_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          SizedBox(height: 20),
          Expanded(child: CustomTapView()),
        ],
      ),
    );
  }
}
