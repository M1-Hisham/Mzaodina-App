import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/DI/setup_get_it.dart';

import 'package:mzaodina_app/core/widgets/custom_erorr_widget.dart';
import 'package:mzaodina_app/core/widgets/shimmer/mazad_shimmer.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/ui/view/widgets/Custom_jaraa_card_item.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/ui/view_model/jaraa_cubit/jaraa_cubit.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_not_item.dart';
import 'package:mzaodina_app/feature/notifications/payment/ui/view_model/Last_invoice_cubit/last_invoice_cubit.dart';
import 'package:mzaodina_app/mzaodina_app.dart';

class CustomOngoingListView extends StatefulWidget {
  final int jaraaCounter;
  const CustomOngoingListView({super.key, required this.jaraaCounter});

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
      bloc: getIt<OngoingCubit>()..getOngoingAuctions(),
      builder: (context, state) {
        if (state is OngoingLoading) {
          return const Center(child: MazadShimmer());
        } else if (state is OngoingError) {
          if (widget.jaraaCounter == 0) {
            return CustomNotItem();
          } else {
            return CustomErorrWidget(
              message: state.errorMessage,
              onRefresh:
                  () => context.read<OngoingCubit>().getOngoingAuctions(),
            );
          }
        } else if (state is OngoingSuccess) {
          final jaraaAuction = state.data;
          return RefreshIndicator(
            onRefresh: () => context.read<OngoingCubit>().getOngoingAuctions(),
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: jaraaAuction.data.auctions.length,
              itemBuilder: (context, index) {
                return CustomOngoingCardViewItem(
                  jaraaDataModel: jaraaAuction.data.auctions[index],
                );
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
