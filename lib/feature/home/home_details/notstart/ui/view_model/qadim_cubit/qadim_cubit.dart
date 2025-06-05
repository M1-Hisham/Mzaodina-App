import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/model/qadim_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/repo/qadim_auction_repo.dart';

part 'qadim_state.dart';

class NotstartCubit extends Cubit<NotstartState> {
  NotstartCubit(this.qadimAuctionRepo) : super(NotstartInitial());
  final NotstartAuctionRepo qadimAuctionRepo;

  Future<void> getNotStartAuctions() async {
    emit(NotstartLoading());
    final response = await qadimAuctionRepo.getNotStartAuctions();

    response.fold(
      (failure) {
        emit(NotstartError(failure.errMessage));
      },
      (success) {
        emit(NotstartSuccess(success));
      },
    );
  }
}
