import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/data/model/tap_checkout_url_model.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/model/subscribe_aution_body.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/repo/subscribe_to_auction_repo.dart';

part 'subscribe_auction_state.dart';

class SubscribeAuctionCubit extends Cubit<SubscribeToAuctionState> {
  SubscribeAuctionCubit(this.subscribeToAuctionRepo)
    : super(SubscribeAuctionInitial());
  final SubscribeAuctionRepo subscribeToAuctionRepo;
  Future<void> subscribeToAuction(
    SubscribeAutionBody subscribeAutionBody,
  ) async {
    emit(SubscribeAuctionLoading());
    final result = await subscribeToAuctionRepo.subscribeToAutionModel(
      subscribeAutionBody,
    );
    result.fold(
      (failure) {
        log('❌ فشل التسجيل: ${failure.errMessage}');
        emit(SubscribeAuctionError(failure.errMessage));
      },
      (data) {
        log('✅ تم الانضمام بنجاح في المزاد');
        emit(SubscribeAuctionSuccess(data));
      },
    );
  }
}
