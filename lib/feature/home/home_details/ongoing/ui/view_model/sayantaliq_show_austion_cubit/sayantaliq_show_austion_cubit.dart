import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/model/sayantaliq_show_auction_mode.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/repo/sayantaliq_show_aution_repo.dart';

part 'sayantaliq_show_austion_state.dart';

class SayantaliqShowAustionCubit extends Cubit<SayantaliqShowAustionState> {
  SayantaliqShowAustionCubit(this.sayantaliqAutionRepo)
    : super(SayantaliqShowAustionInitial());
  final SayantaliqShowAutionRepo sayantaliqAutionRepo;
  Future<void> getSayantaliqShowAuctionCubit(String slug) async {
    emit(SayantaliqShowAustionLoading());
    final result = await sayantaliqAutionRepo.getSayantaliqShowAuction(slug);
    result.fold(
      (failure) => emit(SayantaliqShowAustionErorr(failure.errMessage)),
      (sayantaliqShowAuctionMode) =>
          emit(SayantaliqShowAustionSuccess(sayantaliqShowAuctionMode)),
    );
  }
}
