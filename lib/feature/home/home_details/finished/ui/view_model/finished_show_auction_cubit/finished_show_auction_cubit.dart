import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/data/model/finished_show_auction_model.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/data/repo/finished_show_auction_repo.dart';

part 'finished_show_auction_state.dart';

class FinishedShowAuctionCubit extends Cubit<FinishedShowAuctionState> {
  FinishedShowAuctionCubit(this.finishedAuctionRepo)
    : super(FinishedShowAuctionInitial());
  final FinishedShowAuctionRepo finishedAuctionRepo;
  Future<void> getFinishedShowAuction(String slug) async {
    emit(FinishedShowAuctionLoading());
    final result = await finishedAuctionRepo.getFinishedShowAuction(slug);
    result.fold(
      (failure) => emit(FinishedShowAuctionError(failure.errMessage)),
      (model) => emit(FinishedShowAuctionSuccess(model)),
    );
  }
}
