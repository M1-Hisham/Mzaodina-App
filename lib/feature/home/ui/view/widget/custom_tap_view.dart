import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/DI/setup_get_it.dart';

import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_erorr_widget.dart';
import 'package:mzaodina_app/core/widgets/shimmer/mazad_shimmer.dart';
import 'package:mzaodina_app/feature/home/data/model/tap_view_model.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/ui/view/widgets/custom_jaraa_card_view_item.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/ui/view_model/jaraa_cubit/jaraa_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/muntahi/ui/view/widget/custom_muntahi_cart_view_item.dart';
import 'package:mzaodina_app/feature/home/home_details/muntahi/ui/view_model/muntahi_cubit/muntahi_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/ui/view/widget/custom_qadim_card_view_item.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/ui/view_model/qadim_cubit/qadim_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/sayantaliq/ui/view/widget/custom_sayantaliq_cart_virew_item.dart';
import 'package:mzaodina_app/feature/home/home_details/sayantaliq/ui/view_model/sayantaliq_cubit/sayantaliq_cubit.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_not_item.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_tap_item.dart';
import 'package:mzaodina_app/feature/web-socket/cubit/web_socket_cubit.dart';
import 'package:mzaodina_app/feature/home/ui/view_model/actions-count-cubit/actions_count_cubit.dart';

class CustomTapView extends StatefulWidget {
  const CustomTapView({super.key});

  @override
  State<CustomTapView> createState() => _CustomTapViewState();
}

class _CustomTapViewState extends State<CustomTapView>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);

    _tabController.animation?.addListener(() {
      final newIndex = _tabController.animation!.value.round();
      if (newIndex != selectedIndex) {
        setState(() {
          selectedIndex = newIndex;
        });
      }
    });
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
    return BlocBuilder<ActionsCountCubit, ActionsCountState>(
      bloc: getIt<ActionsCountCubit>()..fetchActionsCount(),
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        int? qadimCount;
        int? sayantaliqCount;
        int? jaraaCount;
        int? muntahiCount;
        if (state is ActionsCountSuccess) {
          final counts = state.response.data;
          qadimCount = counts.notstart.total;
          sayantaliqCount = counts.ready.total;
          jaraaCount = counts.ongoing.total;
          muntahiCount = counts.finished.total;
        }
        return Column(
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
                    String? counter;
                    if (index == 0) {
                      counter =
                          qadimCount == null ? ' ' : qadimCount.toString();
                    }
                    if (index == 1) {
                      counter =
                          sayantaliqCount == null
                              ? ' '
                              : sayantaliqCount.toString();
                    }
                    if (index == 2) {
                      counter =
                          jaraaCount == null ? ' ' : jaraaCount.toString();
                    }
                    if (index == 3) {
                      counter =
                          muntahiCount == null ? ' ' : muntahiCount.toString();
                    }
                    return CustomTapItem(
                      item: item,
                      isSelected: isSelected,
                      selectedColor: color,
                      counter: counter ?? '0',
                    );
                  }).toList(),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BlocBuilder<QadimCubit, QadimState>(
                      bloc: getIt<QadimCubit>()..getNotStartAuctions(),
                      builder: (context, state) {
                        if (state is QadimLoading) {
                          return const Center(child: MazadShimmer());
                        } else if (state is QadimError) {
                          if (qadimCount == 0) {
                            return CustomNotItem();
                          } else {
                            return CustomErorrWidget(
                              message: state.errorMessage,
                              onRefresh:
                                  () =>
                                      context
                                          .read<QadimCubit>()
                                          .getNotStartAuctions(),
                            );
                          }
                        } else if (state is QadimSuccess) {
                          final qadimAuctionResponse = state.data;
                          return ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount:
                                qadimAuctionResponse.data.auctions.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: CustomQadimCardViewItem(
                                  qadimDataModel:
                                      qadimAuctionResponse.data.auctions[index],
                                ),
                              );
                            },
                          );
                        } else {
                          return const Center(child: Text('لا يوجد بيانات'));
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BlocBuilder<SayantaliqCubit, SayantaliqState>(
                      bloc: getIt<SayantaliqCubit>()..getReadyAuctions(),
                      builder: (context, state) {
                        if (state is SayantaliqLoading) {
                          return const Center(child: MazadShimmer());
                        } else if (state is SayantaliqError) {
                          if (sayantaliqCount == 0) {
                            return CustomNotItem();
                          } else {
                            return CustomErorrWidget(
                              message: state.errorMessage,
                              onRefresh:
                                  () =>
                                      context
                                          .read<SayantaliqCubit>()
                                          .getReadyAuctions(),
                            );
                          }
                        } else if (state is SayantaliqSuccess) {
                          final sayantaliqAuctionResponse = state.data;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount:
                                sayantaliqAuctionResponse.data.auctions.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: BlocProvider(
                                  create: (context) => WebSocketCubit(),
                                  child: CustomSayantaliqCardViewItem(
                                    sayantaliqDataModel:
                                        sayantaliqAuctionResponse
                                            .data
                                            .auctions[index],
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return const Center(child: Text('لا يوجد بيانات'));
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BlocBuilder<JaraaCubit, JaraaState>(
                      bloc: getIt<JaraaCubit>()..getOngoingAuctions(),
                      builder: (context, state) {
                        if (state is JaraaLoading) {
                          return const Center(child: MazadShimmer());
                        } else if (state is JaraaError) {
                          if (jaraaCount == 0) {
                            return CustomNotItem();
                          } else {
                            return CustomErorrWidget(
                              message: state.errorMessage,
                              onRefresh:
                                  () =>
                                      context
                                          .read<JaraaCubit>()
                                          .getOngoingAuctions(),
                            );
                          }
                        } else if (state is JaraaSuccess) {
                          final jaraaAuctionResponse = state.data;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount:
                                jaraaAuctionResponse.data.auctions.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: BlocProvider(
                                  create: (context) => WebSocketCubit(),
                                  child: CustomJaraaCardViewItem(
                                    jaraaDataModel:
                                        jaraaAuctionResponse
                                            .data
                                            .auctions[index],
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return const Center(child: Text('لا يوجد بيانات'));
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BlocBuilder<MuntahiCubit, MuntahiState>(
                      bloc: getIt<MuntahiCubit>()..getFinishedAuctions(),
                      builder: (context, state) {
                        if (state is MuntahiLoading) {
                          return const Center(child: MazadShimmer());
                        } else if (state is MuntahiError) {
                          if (muntahiCount == 0) {
                            return CustomNotItem();
                          } else {
                            return CustomErorrWidget(
                              message: state.errorMessage,
                              onRefresh:
                                  () =>
                                      context
                                          .read<MuntahiCubit>()
                                          .getFinishedAuctions(),
                            );
                          }
                        } else if (state is MuntahiSuccess) {
                          final muntaliAuctionResponse = state.data;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount:
                                muntaliAuctionResponse.data.auctions.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: CustomMuntahiCardViewItem(
                                  muntahiDataModel:
                                      muntaliAuctionResponse
                                          .data
                                          .auctions[index],
                                ),
                              );
                            },
                          );
                        } else {
                          return const Center(child: Text('لا يوجد بيانات'));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

final List<Color> selectedTabColors = [
  R.colors.primaryColorLight,
  R.colors.orangeColor,
  R.colors.greenColor,
  R.colors.redColor2,
];
