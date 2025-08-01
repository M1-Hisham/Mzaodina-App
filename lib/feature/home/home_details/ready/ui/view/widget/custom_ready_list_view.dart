import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_erorr_widget.dart';
import 'package:mzaodina_app/core/widgets/shimmer/mazad_shimmer.dart';
import 'package:mzaodina_app/feature/auction/cubit/auction_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/ui/view/widget/custom_ready_card_item.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/ui/view_model/ready_cubit/ready_cubit.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_not_item.dart';
import 'package:mzaodina_app/feature/notifications/payment/ui/view_model/Last_invoice_cubit/last_invoice_cubit.dart';
import 'package:mzaodina_app/mzaodina_app.dart';

class CustomreadyListView extends StatefulWidget {
  final int readyCounter;
  const CustomreadyListView({super.key, required this.readyCounter});

  @override
  State<CustomreadyListView> createState() =>
      _CustomNotstartCardViewItemState();
}

class _CustomNotstartCardViewItemState extends State<CustomreadyListView>
    with RouteAware {
  @override
  void didPopNext() {
    BlocProvider.of<ReadyCubit>(context).getReadyAuctions();
    BlocProvider.of<LastInvoiceCubit>(context).lastInvoiceChecker();
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
    return BlocBuilder<ReadyCubit, ReadyState>(
      buildWhen:
          (previous, current) =>
              current is ReadyLoading ||
              current is ReadySuccess ||
              current is ReadyError,
      builder: (context, state) {
        if (state is ReadyLoading) {
          return const Center(child: MazadShimmer());
        } else if (state is ReadyError) {
          if (widget.readyCounter == 0) {
            return CustomNotItem();
          } else {
            return CustomErorrWidget(
              message: state.errorMessage,
              onRefresh: () => context.read<ReadyCubit>().getReadyAuctions(),
            );
          }
        } else if (state is ReadySuccess) {
          final sayantaliqAuction = state.data;
          // final filteredData =
          //     context
          //         .read<ReadyCubit>()
          //         .filterData(AuctionCubit.get(context).auctionId!)
          //         .where(
          //           (auction) =>
          //               auction.id.toString() !=
          //               AuctionCubit.get(context).auctionId,
          //         )
          //         .toList();
          final totalPage = context.read<ReadyCubit>().totalPages;
          final currentPage = context.read<ReadyCubit>().currentPage;
          AuctionCubit.get(context).auctionsLoop(
            ids:
                state.data.data.auctions
                    .map((toElement) => toElement.id.toString())
                    .toList(),
            state: 'ongoing',
            context: context,
          );

          return RefreshIndicator(
            onRefresh: () => context.read<ReadyCubit>().getReadyAuctions(),
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: sayantaliqAuction.data.auctions.length + 1,
              itemBuilder: (context, index) {
                if (index < sayantaliqAuction.data.auctions.length) {
                  return CustomSayantilqCardItem(
                    sayantaliqDataModel: sayantaliqAuction.data.auctions[index],
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
                                  context.read<ReadyCubit>().getReadyAuctions(
                                    page: page,
                                  );
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
