import 'package:flutter/material.dart';

import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/home/data/model/tap_view_model.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_muntahi_cart_view_item.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_qadim_card_view_item.dart';
import 'package:mzaodina_app/feature/home/home_details/ui/view/widget/custom_sayantaliq_cart_virew_item.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_tap_item.dart';

class CustomTapView extends StatefulWidget {
  const CustomTapView({super.key});

  @override
  State<CustomTapView> createState() => _CustomTapViewState();
}

class _CustomTapViewState extends State<CustomTapView>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController _tabController;
  DateTime eventTimeFromApi = DateTime.parse('2025-05-01 18:00:00');

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<CounterCubit>(context);
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging == false) {
      setState(() {
        selectedIndex = _tabController.index;
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TabBar(
            controller: _tabController,
            labelPadding: const EdgeInsets.all(0),
            dividerHeight: 0,
            indicatorColor: Colors.transparent,
            labelColor: R.colors.primaryColorLight,

            tabs:
                tapViewModel.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  final isSelected = index == selectedIndex;
                  final color =
                      isSelected
                          ? selectedTabColors[index]
                          : Colors.grey.shade300;
                  return CustomTapItem(
                    item: item,
                    isSelected: isSelected,
                    selectedColor: color,
                  );
                }).toList(),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomQadimCardViewItem(),
                  ),
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomSayantaliqCardViewItem(),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomQadimCardViewItem(),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomMuntahiCardViewItem(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final List<Color> selectedTabColors = [
  R.colors.primaryColorLight,
  R.colors.orangeColor,
  R.colors.greenColor,
  R.colors.redColor2,
];
