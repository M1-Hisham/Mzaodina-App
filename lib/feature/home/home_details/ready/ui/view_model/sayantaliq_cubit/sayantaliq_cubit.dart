import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/data/model/sayantaliq_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/data/repo/sayantaliq_aution_repo.dart';

part 'sayantaliq_state.dart';

class ReadyCubit extends Cubit<ReadyState> {
  final ReadyAutionRepo sayantaliqAuctionRepo;
  int currentPage = 1;
  int totalPages = 1;
  ReadyCubit(this.sayantaliqAuctionRepo) : super(ReadyInitial());

  Future<void> getReadyAuctions({int? page}) async {
    emit(ReadyLoading());
    final response = await sayantaliqAuctionRepo.getReadyAuctions(
      page ?? currentPage,
    );

    response.fold(
      (failure) {
        emit(ReadyError(failure.errMessage));
      },
      (success) {
        currentPage = page ?? currentPage;
        totalPages = success.data.meta?.lastPage ?? 1;
        emit(ReadySuccess(success));
      },
    );
  }
}
