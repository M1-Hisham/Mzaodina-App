import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/model/register_to_aution_model.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/repo/register_to_auction_repo.dart';

part 'register_to_auction_state.dart';

class RegisterToAuctionCubit extends Cubit<RegisterToAuctionState> {
  RegisterToAuctionCubit(this.registerToAuctionRepo)
    : super(RegisterToAuctionInitial());
  final RegisterToAuctionRepo registerToAuctionRepo;
  Future<void> registerToAuction(String slug) async {
    emit(RegisterToAuctionLoading());
    final result = await registerToAuctionRepo.getOngoingAuctions(slug);
    result.fold(
      (failure) {
        log('❌ فشل التسجيل: ${failure.errMessage}');
        emit(RegisterToAuctionError(failure.errMessage));
      },
      (data) {
        log('✅ تم التسجيل بنجاح في المزاد');
        emit(RegisterToAuctionSuccess(data));
      },
    );
  }
}
