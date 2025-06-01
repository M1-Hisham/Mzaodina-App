import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/home/data/model/actions_count_model.dart';
import 'package:mzaodina_app/feature/home/data/repo/actions_count_repo.dart';

part 'actions_count_state.dart';

class ActionsCountCubit extends Cubit<ActionsCountState> {
  ActionsCountCubit(this.actionsCountRepo) : super(ActionsCountInitial());
  final ActionsCountRepo actionsCountRepo;

  Future<void> fetchActionsCount() async {
    log('Fetching actions count...');
    emit(ActionsCountLoading());

    final result = await actionsCountRepo.getActionsCount();

    result.fold(
      (failure) {
        log('Error fetching actions count: ${failure.errMessage}');
        emit(ActionsCountFailure(failure.errMessage));
      },
      (response) {
        log('Actions count fetched successfully: ${response.toJson()}');
        emit(ActionsCountSuccess(response));
      },
    );
  }
}
