import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/data/model/auctions_bidding_body.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/data/model/bidding_response_model.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/data/repo/auction_bidding_repo.dart';

part 'auction_bidding_state.dart';

class AuctionBiddingCubit extends Cubit<AuctionBiddingState> {
  AuctionBiddingCubit(this.auctionBiddingRepo) : super(AuctionBiddingInitial());
  final AuctionBiddingRepo auctionBiddingRepo;
  Future<void> getAuctionBidding(
    AuctionsBiddingBody auctionsBiddingBody,
  ) async {
    emit(AuctionBiddingLoading());
    final result = await auctionBiddingRepo.getAuctionBidding(
      auctionsBiddingBody,
    );
    result.fold(
      (failure) {
        emit(AuctionBiddingError(failure.errMessage));
      },
      (data) {
        emit(AuctionBiddingSuccess(data));
      },
    );
  }
}
