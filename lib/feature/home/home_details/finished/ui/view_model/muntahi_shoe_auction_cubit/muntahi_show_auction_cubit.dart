import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/data/model/muntahi_show_auction_model.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/data/repo/muntahi_show_auction_repo.dart';

part 'muntahi_show_auction_state.dart';

class FinishedShowAuctionCubit extends Cubit<FinishedShowAuctionState> {
  FinishedShowAuctionCubit(this.muntahiAuctionRepo)
    : super(FinishedShowAuctionInitial());
  final FinishedShowAuctionRepo muntahiAuctionRepo;
  Future<void> getFinishedShowAuction(String slug) async {
    emit(FinishedShowAuctionLoading());
    final result = await muntahiAuctionRepo.getFinishedShowAuction(slug);
    result.fold(
      (failure) => emit(FinishedShowAuctionError(failure.errMessage)),
      (model) => emit(FinishedShowAuctionSuccess(model)),
    );
  }
}
