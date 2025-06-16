import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/data/model/finished_auctions_response.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/data/repo/finished_auction_repo.dart';

part 'finished_state.dart';

class FinishedCubit extends Cubit<FinishedState> {
  final FinishedAuctionRepo finishedAuctionRepo;
  int currentPage = 1;
  int totalPages = 1;
  FinishedCubit(this.finishedAuctionRepo) : super(FinishedInitial());
  FinishedAuctionsResponse? finishedAuctionsResponse;
  Future<void> getFinishedAuctions({int? page}) async {
    emit(FinishedLoading());
    final response = await finishedAuctionRepo.getFinishedAuctions(
      page ?? currentPage,
    );

    response.fold(
      (failure) {
        emit(FinishedError(failure.errMessage));
      },
      (success) {
        currentPage = page ?? currentPage;
        log('Current Page: $currentPage');
        totalPages = success.data.meta?.lastPage ?? 1;
        log('Total Pages: $totalPages');
        finishedAuctionsResponse = success;
        emit(FinishedSuccess(success));
      },
    );
  }

  void excludeAuctionById(String id) {
    if (finishedAuctionsResponse == null) return;

    final filteredList =
        finishedAuctionsResponse!.data.auctions
            .where((auction) => auction.id.toString() != id)
            .toList();
    final updatedData = finishedAuctionsResponse!.data.copyWith(
      auctions: filteredList,
    );

    final updatedResponse = FinishedAuctionsResponse(
      status: finishedAuctionsResponse!.status,
      message: finishedAuctionsResponse!.message,
      data: updatedData,
    );

    finishedAuctionsResponse = updatedResponse;
    emit(FinishedSuccess(updatedResponse));
  }
}
