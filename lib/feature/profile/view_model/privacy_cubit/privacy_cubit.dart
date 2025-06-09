
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/profile/data/model/info_response.dart';
import 'package:mzaodina_app/feature/profile/data/repo/info_repo.dart';

part 'privacy_state.dart';

class PrivacyCubit extends Cubit<PrivacyState> {
  PrivacyCubit(this.repo) : super(PrivacyInitial());
    final InfoRepo repo;

  Future<void> getPrivacy() async {
    emit(PrivacyLoading());
    final result = await repo.getPrivacy();
    result.fold(
      (failure) => emit(PrivacyError(failure.errMessage)),
      (data) => emit(PrivacySuccess(data)),
    );
  }
}
