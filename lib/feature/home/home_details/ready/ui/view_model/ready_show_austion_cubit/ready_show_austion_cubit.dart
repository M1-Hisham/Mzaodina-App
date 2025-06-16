import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/data/model/ready_show_auction_mode.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/data/repo/ready_show_aution_repo.dart';

part 'ready_show_austion_state.dart';

class ReadyShowAustionCubit extends Cubit<ReadyShowAustionState> {
  ReadyShowAustionCubit(this.readyAutionRepo)
    : super(ReadyShowAustionInitial());
  final ReadyShowAutionRepo readyAutionRepo;
  Future<void> getReadyShowAuctionCubit(String slug) async {
    emit(ReadyShowAustionLoading());
    final result = await readyAutionRepo.getReadyShowAuction(slug);
    result.fold(
      (failure) => emit(ReadyShowAustionErorr(failure.errMessage)),
      (sayantaliqShowAuctionMode) =>
          emit(ReadyShowAustionSuccess(sayantaliqShowAuctionMode)),
    );
  }
}
