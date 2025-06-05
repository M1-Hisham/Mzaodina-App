import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/DI/setup_get_it.dart';

import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_erorr_widget.dart';
import 'package:mzaodina_app/core/widgets/shimmer/mazad_shimmer.dart';
import 'package:mzaodina_app/feature/home/data/model/tap_view_model.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/ui/view/widgets/custom_jaraa_list_view.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/ui/view/widget/custom_muntahi_cart_view_item.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/ui/view_model/muntahi_cubit/muntahi_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/ui/view/widget/custom_qadim_list_view.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/ui/view/widget/custom_sayantaliq_list_view.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_not_item.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_tap_item.dart';
import 'package:mzaodina_app/feature/notifications/payment/ui/view_model/Last_invoice_cubit/last_invoice_cubit.dart';
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

    _tabController.animation?.addListener(() {
      final newIndex = _tabController.animation!.value.round();

      if (newIndex != selectedIndex) {
        setState(() {
          selectedIndex = newIndex;
        });

        context.read<LastInvoiceCubit>().lastInvoiceChecker();
      }
    });
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
              child: BlocListener<LastInvoiceCubit, LastInvoiceState>(
                listener: (context, state) {
                  if (state is LastInvoiceSuccess) {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.invoiceDetailsScreenRoute,
                    );
                  }
                },
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomQadimListView(qadimCounter: qadimCount ?? 0),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: BlocProvider(
                        create: (context) => WebSocketCubit(),
                        child: CustomSayantiqListView(
                          sayantaliqCounter: sayantaliqCount ?? 0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: BlocProvider(
                        create: (context) => WebSocketCubit(),
                        child: CustomJaraaListView(
                          jaraaCounter: jaraaCount ?? 0,
                        ),
                      ),
                    ),

                    // Padding(
                    //   padding: const EdgeInsets.all(16.0),
                    //   child: BlocBuilder<JaraaCubit, JaraaState>(
                    //     bloc: getIt<JaraaCubit>()..getOngoingAuctions(),
                    //     builder: (context, state) {
                    //       if (state is JaraaLoading) {
                    //         return const Center(child: MazadShimmer());
                    //       } else if (state is JaraaError) {
                    //         if (jaraaCount == 0) {
                    //           return CustomNotItem();
                    //         } else {
                    //           return CustomErorrWidget(
                    //             message: state.errorMessage,
                    //             onRefresh:
                    //                 () =>
                    //                     context
                    //                         .read<JaraaCubit>()
                    //                         .getOngoingAuctions(),
                    //           );
                    //         }
                    //       } else if (state is JaraaSuccess) {
                    //         final jaraaAuctionResponse = state.data;
                    //         return ListView.builder(
                    //           padding: EdgeInsets.zero,
                    //           itemCount:
                    //               jaraaAuctionResponse.data.auctions.length,
                    //           itemBuilder: (context, index) {
                    //             return Padding(
                    //               padding: const EdgeInsets.only(bottom: 16.0),
                    //               child: BlocProvider(
                    //                 create: (context) => WebSocketCubit(),
                    //                 child: CustomJaraaCardViewItem(
                    //                   jaraaDataModel:
                    //                       jaraaAuctionResponse
                    //                           .data
                    //                           .auctions[index],
                    //                 ),
                    //               ),
                    //             );
                    //           },
                    //         );
                    //       } else {
                    //         return const Center(child: Text('لا يوجد بيانات'));
                    //       }
                    //     },
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: BlocBuilder<FinishedCubit, FinishedState>(
                        bloc: getIt<FinishedCubit>()..getFinishedAuctions(),
                        builder: (context, state) {
                          if (state is FinishedLoading) {
                            return const Center(child: MazadShimmer());
                          } else if (state is FinishedError) {
                            if (muntahiCount == 0) {
                              return CustomNotItem();
                            } else {
                              return CustomErorrWidget(
                                message: state.errorMessage,
                                onRefresh:
                                    () =>
                                        context
                                            .read<FinishedCubit>()
                                            .getFinishedAuctions(),
                              );
                            }
                          } else if (state is FinishedSuccess) {
                            final muntaliAuctionResponse = state.data;
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount:
                                  muntaliAuctionResponse.data.auctions.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: CustomFinishedCardViewItem(
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
