import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/data/model/muntahi_show_auction_model.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/data/repo/muntahi_show_auction_repo.dart';

part 'muntahi_show_auction_state.dart';

class MuntahiShowAuctionCubit extends Cubit<MuntahiShowAuctionState> {
  MuntahiShowAuctionCubit(this.muntahiAuctionRepo)
    : super(MuntahiShowAuctionInitial());
  final MuntahiShowAuctionRepo muntahiAuctionRepo;
  Future<void> getMuntahiShowAuction(String slug) async {
    emit(MuntahiShowAuctionLoading());
    final result = await muntahiAuctionRepo.getMuntahiShowAuction(slug);
    result.fold(
      (failure) => emit(MuntahiShowAuctionError(failure.errMessage)),
      (model) => emit(MuntahiShowAuctionSuccess(model)),
    );
  }
}
