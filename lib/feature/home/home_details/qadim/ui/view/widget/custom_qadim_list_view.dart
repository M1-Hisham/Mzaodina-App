import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/DI/setup_get_it.dart';
import 'package:mzaodina_app/core/widgets/custom_erorr_widget.dart';
import 'package:mzaodina_app/core/widgets/shimmer/mazad_shimmer.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/ui/view/widget/custom_qadim_card_item.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/ui/view_model/qadim_cubit/qadim_cubit.dart';
import 'package:mzaodina_app/feature/home/ui/view/widget/custom_not_item.dart';
import 'package:mzaodina_app/feature/notifications/payment/ui/view_model/Last_invoice_cubit/last_invoice_cubit.dart';
import 'package:mzaodina_app/mzaodina_app.dart';

class CustomQadimListView extends StatefulWidget {
  const CustomQadimListView({super.key, required this.qadimCounter});

  final int qadimCounter;
  @override
  State<CustomQadimListView> createState() => _CustomQadimListViewState();
}

class _CustomQadimListViewState extends State<CustomQadimListView>
    with RouteAware {
  @override
  void didPopNext() {
    BlocProvider.of<QadimCubit>(context).getNotStartAuctions();
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
    return BlocBuilder<QadimCubit, QadimState>(
      bloc: getIt<QadimCubit>()..getNotStartAuctions(),
      builder: (context, state) {
        if (state is QadimLoading) {
          return const Center(child: MazadShimmer());
        } else if (state is QadimError) {
          if (widget.qadimCounter == 0) {
            return CustomNotItem();
          } else {
            return CustomErorrWidget(
              message: state.errorMessage,
              onRefresh: () => context.read<QadimCubit>().getNotStartAuctions(),
            );
          }
        } else if (state is QadimSuccess) {
          final qadimAuctionResponse = state.data;
          return RefreshIndicator(
            onRefresh: () => context.read<QadimCubit>().getNotStartAuctions(),
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: qadimAuctionResponse.data.auctions.length,
              itemBuilder: (context, index) {
                return CustomQadimCardItem(
                  qadimDataModel: qadimAuctionResponse.data.auctions[index],
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
