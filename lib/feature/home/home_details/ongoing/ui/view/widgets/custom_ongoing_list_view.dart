import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

import 'package:mzaodina_app/core/widgets/custom_erorr_widget.dart';
import 'package:mzaodina_app/core/widgets/shimmer/mazad_shimmer.dart';
import 'package:mzaodina_app/feature/action/cubit/action_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/ui/view/widgets/Custom_ongoing_card_item.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/ui/view_model/ongoing_cubit/ongoing_cubit.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_not_item.dart';
import 'package:mzaodina_app/feature/notifications/payment/ui/view_model/Last_invoice_cubit/last_invoice_cubit.dart';
import 'package:mzaodina_app/mzaodina_app.dart';

class CustomOngoingListView extends StatefulWidget {
  final int ongoingCounter;
  const CustomOngoingListView({super.key, required this.ongoingCounter});

  @override
  State<CustomOngoingListView> createState() =>
      _CustomNotstartCardViewItemState();
}

class _CustomNotstartCardViewItemState extends State<CustomOngoingListView>
    with RouteAware {
  @override
  void didPopNext() {
    BlocProvider.of<OngoingCubit>(context).getOngoingAuctions();
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
    return BlocBuilder<OngoingCubit, OngoingState>(
      buildWhen:
          (previous, current) =>
              current is OngoingLoading ||
              current is OngoingSuccess ||
              current is OngoingError,
      builder: (context, state) {
        if (state is OngoingLoading) {
          return const Center(child: MazadShimmer());
        } else if (state is OngoingError) {
          if (widget.ongoingCounter == 0) {
            return CustomNotItem();
          } else {
            return CustomErorrWidget(
              message: state.errorMessage,
              onRefresh:
                  () => context.read<OngoingCubit>().getOngoingAuctions(),
            );
          }
        } else if (state is OngoingSuccess) {
          final filteredData =
              context
                  .read<OngoingCubit>()
                  .filterData(ActionCubit.get(context).auctionId!)
                  .where(
                    (auction) =>
                        auction.id.toString() !=
                        ActionCubit.get(context).auctionId,
                  )
                  .toList();
          final totalPage = context.read<OngoingCubit>().totalPages;
          final currentPage = context.read<OngoingCubit>().currentPage;
          ActionCubit.get(context).actionsLoop(
            ids:
                state.data.data.auctions
                    .map((toElement) => toElement.id.toString())
                    .toList(),
            state: 'finished',
            context: context,
          );
          return RefreshIndicator(
            onRefresh: () => context.read<OngoingCubit>().getOngoingAuctions(),
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: filteredData.length + 1,
              itemBuilder: (context, index) {
                if (index < filteredData.length) {
                  return CustomOngoingCardViewItem(
                    ongoingDataModel: filteredData[index],
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
                                      .read<OngoingCubit>()
                                      .getOngoingAuctions(page: page);
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
