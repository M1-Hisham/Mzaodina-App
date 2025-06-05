import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/data/model/jaraa_auction_response.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/data/repo/jaraa_auction_repo.dart';

part 'jaraa_state.dart';

class JaraaCubit extends Cubit<JaraaState> {
  JaraaCubit(this.jaraaAuctionRepo) : super(JaraaInitial());
  final JaraaAuctionRepo jaraaAuctionRepo;

  Future<void> getOngoingAuctions() async {
    emit(JaraaLoading());
    final response = await jaraaAuctionRepo.getOngoingAuctions();

    response.fold(
      (failure) {
        emit(JaraaError(failure.errMessage));
      },
      (success) {
        emit(JaraaSuccess(success));
      },
    );
  }
}
