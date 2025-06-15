import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/DI/setup_get_it.dart';

import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/router/app_routes.dart';
import 'package:mzaodina_app/core/widgets/custom_erorr_widget.dart';
import 'package:mzaodina_app/core/widgets/shimmer/mazad_shimmer.dart';
import 'package:mzaodina_app/feature/home/data/model/tap_view_model.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/ui/view_model/qadim_cubit/qadim_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/ui/view/widgets/custom_jaraa_list_view.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/ui/view/widget/custom_muntahi_cart_view_item.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/ui/view_model/muntahi_cubit/muntahi_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/ui/view/widget/custom_qadim_list_view.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/ui/view_model/jaraa_cubit/jaraa_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/ui/view/widget/custom_sayantaliq_list_view.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/ui/view_model/sayantaliq_cubit/sayantaliq_cubit.dart';
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
        if (newIndex == 0) {
          context.read<NotstartCubit>().getNotStartAuctions();
        }
        if (newIndex == 1) {
          context.read<ReadyCubit>().getReadyAuctions();
        }
        if (newIndex == 2) {
          context.read<OngoingCubit>().getOngoingAuctions();
        }

        if (newIndex == 3) {
          context.read<FinishedCubit>().getFinishedAuctions(page: 1);
        }

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
              child: BlocProvider(
                create: (context) => getIt<LastInvoiceCubit>(),
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
                        child: CustomNotstartListView(
                          qadimCounter: qadimCount ?? 0,
                        ),
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
                          child: CustomOngoingListView(
                            jaraaCounter: jaraaCount ?? 0,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: BlocBuilder<FinishedCubit, FinishedState>(
                          buildWhen:
                              (previous, current) =>
                                  current is FinishedSuccess ||
                                  current is FinishedLoading ||
                                  current is FinishedError,
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
                              final totalPage =
                                  context.read<FinishedCubit>().totalPages;
                              final currentPage =
                                  context.read<FinishedCubit>().currentPage;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount:
                                    muntaliAuctionResponse
                                        .data
                                        .auctions
                                        .length +
                                    1,
                                itemBuilder: (context, index) {
                                  if (index <
                                      muntaliAuctionResponse
                                          .data
                                          .auctions
                                          .length) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 16.0,
                                      ),
                                      child: CustomFinishedCardViewItem(
                                        muntahiDataModel:
                                            muntaliAuctionResponse
                                                .data
                                                .auctions[index],
                                      ),
                                    );
                                  } else if (totalPage > 1) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                      ),
                                      child: Wrap(
                                        alignment: WrapAlignment.center,
                                        spacing: 15,
                                        children: List.generate(totalPage, (i) {
                                          final page = i + 1;
                                          final isSelected =
                                              page == currentPage;

                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 6,
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                context
                                                    .read<FinishedCubit>()
                                                    .getFinishedAuctions(
                                                      page: page,
                                                    );
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 6,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color:
                                                      isSelected
                                                          ? R
                                                              .colors
                                                              .primaryColorLight
                                                          : Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Text(
                                                  '$page',
                                                  style: TextStyle(
                                                    color:
                                                        isSelected
                                                            ? Colors.white
                                                            : Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    );
                                  }
                                  return const SizedBox.shrink();
                                },
                              );
                            } else {
                              return const Center(
                                child: Text('لا يوجد بيانات'),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
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
