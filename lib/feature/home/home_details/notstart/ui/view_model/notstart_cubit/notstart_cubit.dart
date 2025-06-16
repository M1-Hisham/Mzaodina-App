import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/data/model/home_details_model.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/model/notstart_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/repo/notstart_auction_repo.dart';

part 'notstart_state.dart';

class NotstartCubit extends Cubit<NotstartState> {
  final NotstartAuctionRepo notstartAuctionRepo;
  int currentPage = 1;
  int totalPages = 1;
  HomeDetailsModel? notstartAuctionResponse;

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

  List<UnifiedAuction> filterData(String id) {
    final filtered =
        notstartAuctionResponse?.data.auctions
            .where((model) => model.id.toString() != id)
            .toList();

  // List<NotstartAuction> filterData(String id) {
  //   final filtered =
  //       notstartAuctionResponse?.data.auctions
  //           .where((model) => model.id.toString() != id)
  //           .toList();


  //   emit(FilterState());
  //   print("sss");

  //   return filtered ?? [];
  // }
}
