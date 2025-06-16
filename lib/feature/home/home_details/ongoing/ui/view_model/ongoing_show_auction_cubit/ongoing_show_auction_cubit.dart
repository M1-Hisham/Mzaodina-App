import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/model/ongoing_show_auction_model.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/repo/ongoing_show_auction_repo.dart';

part 'ongoing_show_auction_state.dart';

class OngoingShowAuctionCubit extends Cubit<OngoingShowAuctionState> {
  OngoingShowAuctionCubit(this.ongoingShowAuctionRepo)
    : super(OngoingShowAuctionInitial());
  final OngoingShowAuctionRepo ongoingShowAuctionRepo;
  Future<void> getOngoingShowAuctionCubit(String slug) async {
    emit(OngoingShowAuctionLoading());
    final result = await ongoingShowAuctionRepo.getongoingShowAuctions(slug);
    result.fold(
      (failure) => emit(OngoingShowAuctionErorr(failure.errMessage)),
      (ongoingShowAuctionMode) =>
          emit(OngoingShowAuctionSuccess(ongoingShowAuctionMode)),
    );
  }
}
