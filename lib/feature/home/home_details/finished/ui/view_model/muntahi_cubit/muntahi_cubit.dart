import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/data/model/muntahi_auctions_response.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/data/repo/muntahi_auction_repo.dart';

part 'muntahi_state.dart';

class FinishedCubit extends Cubit<FinishedState> {
  FinishedCubit(this.muntahiAuctionRepo) : super(FinishedInitial());
  final FinishedAuctionRepo muntahiAuctionRepo;
  Future<void> getFinishedAuctions() async {
    emit(FinishedLoading());
    final response = await muntahiAuctionRepo.getFinishedAuctions();

    response.fold(
      (failure) {
        emit(FinishedError(failure.errMessage));
      },
      (success) {
        emit(FinishedSuccess(success));
      },
    );
  }
}
