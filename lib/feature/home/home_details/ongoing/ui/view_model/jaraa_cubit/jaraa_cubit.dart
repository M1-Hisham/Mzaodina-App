import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/model/jaraa_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/data/repo/jaraa_auction_repo.dart';

part 'jaraa_state.dart';

class OngoingCubit extends Cubit<OngoingState> {
  final OngoingAuctionRepo jaraaAuctionRepo;
  int currentPage = 1;
  int totalPages = 1;
  OngoingAuctionResponse? ongoingAuctionResponse;
  OngoingCubit(this.jaraaAuctionRepo) : super(OngoingInitial());

  Future<void> getOngoingAuctions({int? page}) async {
    emit(OngoingLoading());
    final response = await jaraaAuctionRepo.getOngoingAuctions(
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

  List<OngoingAuction> filterData(String id) {
    final filtered =
        ongoingAuctionResponse?.data.auctions
            .where((model) => model.id.toString() != id)
            .toList();

    emit(FilterState());
    return filtered ?? [];
  }
}
