import 'package:flutter/material.dart';

import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/home/data/model/tap_view_model.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_card_view_item.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_not_item.dart';
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
                tapViewModel.map((item) {
                  var isSelected = tapViewModel.indexOf(item) == selectedIndex;
                  return CustomTapItem(item: item, isSelected: isSelected);
                }).toList(),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(child: CustomNotItem()),
                Center(),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomCardViewItem(),
                  ),
                ),
                Center(child: Text("")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
