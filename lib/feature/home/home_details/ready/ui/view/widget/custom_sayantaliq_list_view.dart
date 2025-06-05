import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/DI/setup_get_it.dart';
import 'package:mzaodina_app/core/widgets/custom_erorr_widget.dart';
import 'package:mzaodina_app/core/widgets/shimmer/mazad_shimmer.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/ui/view/widget/custom_sayantilq_card_item.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/ui/view_model/sayantaliq_cubit/sayantaliq_cubit.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_not_item.dart';
import 'package:mzaodina_app/feature/notifications/payment/ui/view_model/Last_invoice_cubit/last_invoice_cubit.dart';
import 'package:mzaodina_app/mzaodina_app.dart';

class CustomSayantiqListView extends StatefulWidget {
  final int sayantaliqCounter;
  const CustomSayantiqListView({super.key, required this.sayantaliqCounter});

  @override
  State<CustomSayantiqListView> createState() =>
      _CustomNotstartCardViewItemState();
}

class _CustomNotstartCardViewItemState extends State<CustomSayantiqListView>
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
      bloc: getIt<ReadyCubit>()..getReadyAuctions(),
      builder: (context, state) {
        if (state is ReadyLoading) {
          return const Center(child: MazadShimmer());
        } else if (state is ReadyError) {
          if (widget.sayantaliqCounter == 0) {
            return CustomNotItem();
          } else {
            return CustomErorrWidget(
              message: state.errorMessage,
              onRefresh: () => context.read<ReadyCubit>().getReadyAuctions(),
            );
          }
        } else if (state is ReadySuccess) {
          final sayantaliqAuction = state.data;
          return RefreshIndicator(
            onRefresh: () => context.read<ReadyCubit>().getReadyAuctions(),
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: sayantaliqAuction.data.auctions.length,
              itemBuilder: (context, index) {
                return CustomSayantilqCardItem(
                  sayantaliqDataModel: sayantaliqAuction.data.auctions[index],
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
