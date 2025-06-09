
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/profile/data/model/info_response.dart';
import 'package:mzaodina_app/feature/profile/data/repo/info_repo.dart';

part 'about_us_state.dart';

class AboutUsCubit extends Cubit<AboutUsState> {
  AboutUsCubit(this.repo) : super(AboutUsInitial());
  final InfoRepo repo;

  Future<void> getAboutUs() async {
    emit(AboutUsLoading());
    final result = await repo.getAboutUs();
    result.fold(
      (failure) => emit(AboutUsError(failure.errMessage)),
      (data) => emit(AboutUsSuccess(data)),
    );
  }
}
