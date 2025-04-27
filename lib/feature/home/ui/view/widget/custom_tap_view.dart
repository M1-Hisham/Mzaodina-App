import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/home/data/model/tap_view_model.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_tap_item.dart';

class CustomTapView extends StatefulWidget {
  const CustomTapView({super.key});

  @override
  State<CustomTapView> createState() => _CustomTapViewState();
}

class _CustomTapViewState extends State<CustomTapView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          TabBar(
            labelPadding: const EdgeInsets.all(0),
            dividerHeight: 0,
            indicatorColor: Colors.transparent,
            labelColor: R.colors.primaryColorLight,
            onTap: (value) {
              selectedIndex = value;
              setState(() {});
            },
            tabs:
                tapViewModel.map((item) {
                  var isSelected = tapViewModel.indexOf(item) == selectedIndex;
                  return CustomTapItem(item: item, isSelected: isSelected);
                }).toList(),
          ),
          Expanded(
            child: TabBarView(
              children: [
                Center(child: CustomNotItem()),
                Center(child: Text('Page 2')),
                Center(child: Text('Page 3')),
                Center(child: Text('Page 4')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomNotItem extends StatelessWidget {
  const CustomNotItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(R.images.notItemImagePng, width: 175, height: 170),
        SizedBox(height: 20),
        Text('لايوجد مزادات', style: R.textStyles.font22blackW500Light),
      ],
    );
  }
}

class CustomTapViewItem extends StatelessWidget {
  const CustomTapViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}