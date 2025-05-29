import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/data/model/qadim_show_action_model.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/data/repo/qadim_show_action_repo.dart';

part 'qadim_show_action_state.dart';

class QadimShowActionCubit extends Cubit<QadimShowActionState> {
  QadimShowActionCubit(this.showActionRepo) : super(QadimShowActionInitial());
  final QadimShowActionRepo showActionRepo;

  Future<void> getShowAction(String slug) async {
    emit(QadimShowActionLoading());

    final result = await showActionRepo.getShowActionRepo(slug);

    result.fold(
      (failure) {
        log(' Failure: ${failure.errMessage}');
        emit(QadimShowActionError(failure.errMessage));
      },
      (showActionModel) {
        emit(QadimShowActionSuccess(showActionModel));
      },
    );
  }
}
