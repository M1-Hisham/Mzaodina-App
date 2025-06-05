import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/model/jaraa_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/repo/jaraa_auction_repo.dart';

part 'jaraa_state.dart';

class OngoingCubit extends Cubit<OngoingState> {
  OngoingCubit(this.jaraaAuctionRepo) : super(OngoingInitial());
  final OngoingAuctionRepo jaraaAuctionRepo;

  Future<void> getOngoingAuctions() async {
    emit(OngoingLoading());
    final response = await jaraaAuctionRepo.getOngoingAuctions();

    response.fold(
      (failure) {
        emit(OngoingError(failure.errMessage));
      },
      (success) {
        emit(OngoingSuccess(success));
      },
    );
  }
}
