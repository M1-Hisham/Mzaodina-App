import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/model/jaraa_show_auction_model.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/repo/jaraa_show_auction_repo.dart';

part 'jaraa_show_auction_state.dart';

class OngoingShowAuctionCubit extends Cubit<OngoingShowAuctionState> {
  OngoingShowAuctionCubit(this.jaraaShowAuctionRepo)
    : super(OngoingShowAuctionInitial());
  final OngoingShowAuctionRepo jaraaShowAuctionRepo;
  Future<void> getOngoingShowAuctionCubit(String slug) async {
    emit(OngoingShowAuctionLoading());
    final result = await jaraaShowAuctionRepo.getjaraaShowAuctions(slug);
    result.fold(
      (failure) => emit(OngoingShowAuctionErorr(failure.errMessage)),
      (sayantaliqShowAuctionMode) =>
          emit(OngoingShowAuctionSuccess(sayantaliqShowAuctionMode)),
    );
  }
}
