import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/model/ongoing_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/repo/ongoing_auction_repo.dart';

part 'ongoing_state.dart';

class OngoingCubit extends Cubit<OngoingState> {
  final OngoingAuctionRepo ongoingAuctionRepo;
  int currentPage = 1;
  int totalPages = 1;
  OngoingAuctionResponse? ongoingAuctionResponse;
  OngoingCubit(this.ongoingAuctionRepo) : super(OngoingInitial());

  Future<void> getOngoingAuctions({int? page}) async {
    emit(OngoingLoading());
    final response = await ongoingAuctionRepo.getOngoingAuctions(
      page ?? currentPage,
    );

    response.fold(
      (failure) {
        emit(OngoingError(failure.errMessage));
      },
      (success) {
        currentPage = page ?? currentPage;
        totalPages = success.data.meta?.lastPage ?? 1;
        ongoingAuctionResponse = success;
        emit(OngoingSuccess(success));
      },
    );
  }

  // List<OngoingAuction> filterData(String id) {
  //   final filtered =
  //       ongoingAuctionResponse?.data.auctions
  //           .where((model) => model.id.toString() != id)
  //           .toList();

  //   emit(FilterState());
  //   return filtered ?? [];
  // }
}
