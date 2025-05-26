import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/data/model/subscribe_aution_body.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/data/model/subscribe_to_aution_model.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/data/repo/subscribe_to_auction_repo.dart';

part 'subscribe_to_auction_state.dart';

class SubscribeToAuctionCubit extends Cubit<SubscribeToAuctionState> {
  SubscribeToAuctionCubit(this.subscribeToAuctionRepo)
    : super(SubscribeToAuctionInitial());
  final SubscribeToAuctionRepo subscribeToAuctionRepo;
  Future<void> subscribeToAuction(
    SubscribeAutionBody subscribeAutionBody,
  ) async {
    emit(SubscribeToAuctionLoading());
    final result = await subscribeToAuctionRepo.subscribeToAutionModel(
      subscribeAutionBody,
    );
    result.fold(
      (failure) {
        log('❌ فشل التسجيل: ${failure.errMessage}');
        emit(SubscribeToAuctionError(failure.errMessage));
      },
      (data) {
        log('✅ تم الانضمام بنجاح في المزاد');
        emit(SubscribeToAuctionSuccess(data));
      },
    );
  }
}
