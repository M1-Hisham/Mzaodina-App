
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/profile/data/model/info_response.dart';
import 'package:mzaodina_app/feature/profile/data/repo/info_repo.dart';

part 'auction_terms_state.dart';

class AuctionTermsCubit extends Cubit<AuctionTermsState> {
  AuctionTermsCubit(this.repo) : super(AuctionTermsInitial());
    final InfoRepo repo;

  Future<void> getAuctionTerms() async {
    emit(AuctionTermsLoading());
    final result = await repo.getAuctionTerms();
    result.fold(
      (failure) => emit(AuctionTermsError(failure.errMessage)),
      (data) => emit(AuctionTermsSuccess(data)),
    );
  }
}
