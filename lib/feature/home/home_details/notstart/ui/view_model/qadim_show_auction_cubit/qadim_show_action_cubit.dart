import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/model/qadim_show_action_model.dart';
import 'package:mzaodina_app/feature/home/home_details/notstart/data/repo/qadim_show_action_repo.dart';

part 'qadim_show_action_state.dart';

class NotstartShowActionCubit extends Cubit<NotstartShowActionState> {
  NotstartShowActionCubit(this.showActionRepo)
    : super(NotstartShowActionInitial());
  final NotstartShowActionRepo showActionRepo;

  Future<void> getShowAction(String slug) async {
    emit(NotstartShowActionInitial());
    emit(NotstartShowActionLoading());

    final result = await showActionRepo.getShowActionRepo(slug);

    result.fold(
      (failure) {
        log(' Failure: ${failure.errMessage}');
        emit(NotstartShowActionError(failure.errMessage));
      },
      (showActionModel) {
        if (!isClosed) emit(NotstartShowActionSuccess(showActionModel));
      },
    );
  }
}
