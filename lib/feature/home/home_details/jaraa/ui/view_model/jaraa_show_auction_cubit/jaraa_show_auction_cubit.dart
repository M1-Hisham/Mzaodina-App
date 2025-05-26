import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/data/model/jaraa_show_auction_model.dart';
import 'package:mzaodina_app/feature/home/home_details/jaraa/data/repo/jaraa_show_auction_repo.dart';

part 'jaraa_show_auction_state.dart';

class JaraaShowAuctionCubit extends Cubit<JaraaShowAuctionState> {
  JaraaShowAuctionCubit(this.jaraaShowAuctionRepo)
    : super(JaraaShowAuctionInitial());
  final JaraaShowAuctionRepo jaraaShowAuctionRepo;
  Future<void> getJaraaShowAuctionCubit(String slug) async {
    emit(JaraaShowAuctionLoading());
    final result = await jaraaShowAuctionRepo.getjaraaShowAuctions(slug);
    result.fold(
      (failure) => emit(JaraaShowAuctionErorr(failure.errMessage)),
      (sayantaliqShowAuctionMode) =>
          emit(JaraaShowAuctionSuccess(sayantaliqShowAuctionMode)),
    );
  }
}
