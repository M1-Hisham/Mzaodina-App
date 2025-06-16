import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_erorr_widget.dart';
import 'package:mzaodina_app/core/widgets/shimmer/mazad_shimmer.dart';
import 'package:mzaodina_app/feature/auction/cubit/auction_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/ui/view/widget/custom_notstart_card_item.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/ui/view_model/notstart_cubit/notstart_cubit.dart';

import 'package:mzaodina_app/feature/home/ui/view/widget/custom_not_item.dart';
import 'package:mzaodina_app/feature/notifications/payment/ui/view_model/Last_invoice_cubit/last_invoice_cubit.dart';
import 'package:mzaodina_app/feature/notifications/ui/view_model/get_notification_cubit/get_notification_cubit.dart';
import 'package:mzaodina_app/mzaodina_app.dart';

class CustomNotstartListView extends StatefulWidget {
  const CustomNotstartListView({super.key, required this.qadimCounter});

  final int qadimCounter;
  @override
  State<CustomNotstartListView> createState() => _CustomNotstartListViewState();
}

class _CustomNotstartListViewState extends State<CustomNotstartListView>
    with RouteAware {
  @override
  void didPopNext() {
    BlocProvider.of<NotstartCubit>(context).getNotStartAuctions();
    BlocProvider.of<LastInvoiceCubit>(context).lastInvoiceChecker();
    BlocProvider.of<GetNotificationCubit>(context).fetchNotifications(1);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // تسجيل الصفحة في RouteObserver
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    // دايمًا لازم تلغي التسجيل
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotstartCubit, NotstartState>(
      buildWhen:
          (previous, current) =>
              current is NotstartLoading ||
              current is NotstartSuccess ||
              current is NotstartError,
      builder: (context, state) {
        if (state is NotstartLoading) {
          return const Center(child: MazadShimmer());
        } else if (state is NotstartError) {
          if (widget.qadimCounter == 0) {
            return CustomNotItem();
          } else {
            return CustomErorrWidget(
              message: state.errorMessage,
              onRefresh:
                  () => context.read<NotstartCubit>().getNotStartAuctions(),
            );
          }
        } else if (state is NotstartSuccess) {
          final qadimAuctionResponse = state.data;

          final totalPage = context.read<NotstartCubit>().totalPages;
          final currentPage = context.read<NotstartCubit>().currentPage;
          AuctionCubit.get(context).auctionsLoop(
            ids:
                state.data.data.auctions
                    .map((toElement) => toElement.id.toString())
                    .toList(),
            state: 'ready',
            context: context,
          );
          return RefreshIndicator(
            onRefresh: () async {
              await Future.wait([
                context.read<NotstartCubit>().getNotStartAuctions(),
                BlocProvider.of<GetNotificationCubit>(
                  context,
                ).fetchNotifications(1),
              ]);
            },
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: qadimAuctionResponse.data.auctions.length,
              itemBuilder: (context, index) {
                if (index < qadimAuctionResponse.data.auctions.length) {
                  return CustomNotstartCardItem(
                    notstartDataModel:
                        qadimAuctionResponse.data.auctions[index],
                  );
                } else {
                  return totalPage > 1
                      ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 15,
                          children: List.generate(totalPage, (i) {
                            final page = i + 1;
                            final isSelected = page == currentPage;

                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: InkWell(
                                onTap: () {
                                  context
                                      .read<NotstartCubit>()
                                      .getNotStartAuctions(page: page);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        isSelected
                                            ? R.colors.primaryColorLight
                                            : Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
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
                      )
                      : SizedBox.shrink();
                }
              },
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
