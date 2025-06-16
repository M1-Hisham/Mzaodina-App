import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/data/model/home_details_model.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/data/model/finished_auctions_response.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/data/repo/finished_auction_repo.dart';

part 'finished_state.dart';

class FinishedCubit extends Cubit<FinishedState> {
  final FinishedAuctionRepo finishedAuctionRepo;
  int currentPage = 1;
  int totalPages = 1;
  FinishedCubit(this.finishedAuctionRepo) : super(FinishedInitial());
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
        emit(FinishedSuccess(success));
      },
    );
  }
}
