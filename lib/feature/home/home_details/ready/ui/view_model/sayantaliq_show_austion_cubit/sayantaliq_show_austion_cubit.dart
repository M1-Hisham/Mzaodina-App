import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/data/model/sayantaliq_show_auction_mode.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/data/repo/sayantaliq_show_aution_repo.dart';

part 'sayantaliq_show_austion_state.dart';

class ReadyShowAustionCubit extends Cubit<ReadyShowAustionState> {
  ReadyShowAustionCubit(this.sayantaliqAutionRepo)
    : super(ReadyShowAustionInitial());
  final ReadyShowAutionRepo sayantaliqAutionRepo;
  Future<void> getReadyShowAuctionCubit(String slug) async {
    emit(ReadyShowAustionLoading());
    final result = await sayantaliqAutionRepo.getReadyShowAuction(slug);
    result.fold(
      (failure) => emit(ReadyShowAustionErorr(failure.errMessage)),
      (sayantaliqShowAuctionMode) =>
          emit(ReadyShowAustionSuccess(sayantaliqShowAuctionMode)),
    );
  }
}
