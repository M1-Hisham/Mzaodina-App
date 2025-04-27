import 'package:flutter/material.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/home/data/model/tap_view_model.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_not_item.dart';
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
                Center(child: Text("")),
                Center(child: Text("")),
                Center(child: Text("")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
