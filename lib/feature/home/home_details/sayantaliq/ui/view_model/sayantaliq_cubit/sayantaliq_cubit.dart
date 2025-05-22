import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/sayantaliq/data/model/sayantaliq_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/sayantaliq/data/repo/sayantaliq_aution_repo.dart';

part 'sayantaliq_state.dart';

class SayantaliqCubit extends Cubit<SayantaliqState> {
  SayantaliqCubit(this.sayantaliqAuctionRepo) : super(SayantaliqInitial());
  final SayantaliqAutionRepo sayantaliqAuctionRepo;

  Future<void> getReadyAuctions() async {
    emit(SayantaliqLoading());
    final response = await sayantaliqAuctionRepo.getReadyAuctions();

    response.fold(
      (failure) {
        emit(SayantaliqError(failure.errMessage));
      },
      (success) {
        emit(SayantaliqSuccess(success));
      },
    );
  }
}
