import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/data/model/auctions_bidding_history_model.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/data/repo/auctions_bidding_history_repo.dart';

part 'auctions_bidding_history_state.dart';

class AuctionsBiddingHistoryCubit extends Cubit<AuctionsBiddingHistoryState> {
  AuctionsBiddingHistoryCubit(this.auctionsBiddingHistoryRepo)
    : super(AuctionsBiddingHistoryInitial());
  final AuctionsBiddingHistoryRepo auctionsBiddingHistoryRepo;
  Future<void> getAuctionsBiddingHistory(String slug) async {
    if (isClosed) return;

    emit(AuctionsBiddingHistoryLoading());

    final result = await auctionsBiddingHistoryRepo.getAuctionsBiddingHistory(
      slug,
    );

    if (isClosed) return;

    result.fold(
      (failure) {
        if (!isClosed) emit(AuctionsBiddingHistoryError(failure.errMessage));
      },
      (data) {
        if (!isClosed) emit(AuctionsBiddingHistorySuccess(data));
      },
    );
  }
}
