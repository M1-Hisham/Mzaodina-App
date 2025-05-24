import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/data/model/show_action_model.dart';
import 'package:mzaodina_app/feature/home/home_details/data/repo/show_action_repo.dart';

part 'show_action_state.dart';

class ShowActionCubit extends Cubit<ShowActionState> {
  ShowActionCubit(this.showActionRepo) : super(ShowActionInitial());
  final ShowActionRepo showActionRepo;

  Future<void> getShowAction(String slug) async {
    emit(ShowActionLoading());

    final result = await showActionRepo.getShowActionRepo(slug);

    result.fold(
      (failure) {
        log(' Failure: ${failure.errMessage}');
        emit(ShowActionError(failure.errMessage));
      },
      (showActionModel) {
        emit(ShowActionSuccess(showActionModel));
      },
    );
  }
}
