import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/data/model/sayantaliq_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/data/repo/sayantaliq_aution_repo.dart';

part 'sayantaliq_state.dart';

class ReadyCubit extends Cubit<ReadyState> {
  ReadyCubit(this.sayantaliqAuctionRepo) : super(ReadyInitial());
  final ReadyAutionRepo sayantaliqAuctionRepo;

  Future<void> getReadyAuctions() async {
    emit(ReadyLoading());
    final response = await sayantaliqAuctionRepo.getReadyAuctions();

    response.fold(
      (failure) {
        emit(ReadyError(failure.errMessage));
      },
      (success) {
        emit(ReadySuccess(success));
      },
    );
  }
}
