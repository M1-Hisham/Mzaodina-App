
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/profile/data/model/info_response.dart';
import 'package:mzaodina_app/feature/profile/data/repo/info_repo.dart';

part 'terms_state.dart';

class TermsCubit extends Cubit<TermsState> {
  TermsCubit(this.repo) : super(TermsInitial());
  final InfoRepo repo;

  Future<void> getTerms() async {
    emit(TermsLoading());
    final result = await repo.getTerms();
    result.fold(
      (failure) => emit(TermsError(failure.errMessage)),
      (data) => emit(TermsSuccess(data)),
    );
  }
}
