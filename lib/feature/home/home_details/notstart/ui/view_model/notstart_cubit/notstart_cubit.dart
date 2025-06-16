import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/model/notstart_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/repo/notstart_auction_repo.dart';

part 'notstart_state.dart';

class NotstartCubit extends Cubit<NotstartState> {
  final NotstartAuctionRepo notstartAuctionRepo;
  int currentPage = 1;
  int totalPages = 1;
  NotstartAuctionResponse? notstartAuctionResponse;

  NotstartCubit(this.notstartAuctionRepo) : super(NotstartInitial());

  Future<void> getNotStartAuctions({int? page}) async {
    emit(NotstartLoading());
    final response = await notstartAuctionRepo.getNotStartAuctions(page ?? 1);

    response.fold(
      (failure) {
        emit(NotstartError(failure.errMessage));
      },
      (success) {
        currentPage = page ?? currentPage;
        totalPages = success.data.meta?.lastPage ?? 1;
        notstartAuctionResponse = success;
        emit(NotstartSuccess(success));
      },
    );
  }

  void excludeAuctionById(String id) {
    if (notstartAuctionResponse == null) return;

    final filteredList =
        notstartAuctionResponse!.data.auctions
            .where((auction) => auction.id.toString() != id)
            .toList();
    final updatedData = notstartAuctionResponse!.data.copyWith(
      auctions: filteredList,
    );

    final updatedResponse = NotstartAuctionResponse(
      status: notstartAuctionResponse!.status,
      message: notstartAuctionResponse!.message,
      data: updatedData,
    );

    notstartAuctionResponse = updatedResponse;
    emit(NotstartSuccess(updatedResponse));
  }
}
