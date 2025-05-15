import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/api/dio_factory.dart';
import 'package:mzaodina_app/core/api/api_service.dart';
import 'package:mzaodina_app/core/helper/shaerd_pref_helper.dart';
import 'package:mzaodina_app/feature/profile/view-model/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileCubitState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> logout() async {
    emit(ProfileLogoutLoading());
    try {
      final dio = await DioFactory.getDio();
      final api = ApiService(dio);
      await api.logout();
      await SharedPrefHelper.clearAllSecuredData();
      emit(ProfileLogoutSuccess());
    } catch (e) {
      emit(ProfileLogoutError(e.toString()));
    }
  }
}
