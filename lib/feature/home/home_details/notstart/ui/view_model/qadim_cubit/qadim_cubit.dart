import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/model/qadim_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/repo/qadim_auction_repo.dart';

part 'qadim_state.dart';

class NotstartCubit extends Cubit<NotstartState> {
  final NotstartAuctionRepo qadimAuctionRepo;
  int currentPage = 1;
  int totalPages = 1;
  NotstartAuctionResponse? notstartAuctionResponse;

  NotstartCubit(this.qadimAuctionRepo) : super(NotstartInitial());

  Future<void> getNotStartAuctions({int? page}) async {
    emit(NotstartLoading());
    final response = await qadimAuctionRepo.getNotStartAuctions(page ?? 1);

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
