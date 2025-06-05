import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/data/model/muntahi_auctions_response.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/data/repo/muntahi_auction_repo.dart';

part 'muntahi_state.dart';

class MuntahiCubit extends Cubit<MuntahiState> {
  MuntahiCubit(this.muntahiAuctionRepo) : super(MuntahiInitial());
  final MuntahiAuctionRepo muntahiAuctionRepo;
  Future<void> getFinishedAuctions() async {
    emit(MuntahiLoading());
    final response = await muntahiAuctionRepo.getFinishedAuctions();

    response.fold(
      (failure) {
        emit(MuntahiError(failure.errMessage));
      },
      (success) {
        emit(MuntahiSuccess(success));
      },
    );
  }
}
