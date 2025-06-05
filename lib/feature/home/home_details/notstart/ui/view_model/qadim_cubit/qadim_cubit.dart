import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/model/qadim_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/repo/qadim_auction_repo.dart';

part 'qadim_state.dart';

class QadimCubit extends Cubit<QadimState> {
  QadimCubit(this.qadimAuctionRepo) : super(QadimInitial());
  final QadimAuctionRepo qadimAuctionRepo;

  Future<void> getNotStartAuctions() async {
    emit(QadimLoading());
    final response = await qadimAuctionRepo.getNotStartAuctions();

    response.fold(
      (failure) {
        emit(QadimError(failure.errMessage));
      },
      (success) {
        emit(QadimSuccess(success));
      },
    );
  }
}
