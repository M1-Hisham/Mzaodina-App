import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/data/model/home_details_model.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/data/model/ready_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/data/repo/ready_aution_repo.dart';

part 'ready_state.dart';

class ReadyCubit extends Cubit<ReadyState> {
  final ReadyAutionRepo sayantaliqAuctionRepo;
  int currentPage = 1;
  int totalPages = 1;
  HomeDetailsModel? readyAuctionResponse;
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
        readyAuctionResponse = success;

        emit(ReadySuccess(success));
      },
    );
  }

  List<UnifiedAuction> filterData(String id) {
    final filtered =
        readyAuctionResponse?.data.auctions
            .where((model) => model.id.toString() != id)
            .toList();

  // List<ReadyAuction> filterData(String id) {
  //   final filtered =
  //       readyAuctionResponse?.data.auctions
  //           .where((model) => model.id.toString() != id)
  //           .toList();


  //   emit(FilterState());
  //   return filtered ?? [];
  // }
}
