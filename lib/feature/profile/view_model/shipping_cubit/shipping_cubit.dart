
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/profile/data/model/info_response.dart';
import 'package:mzaodina_app/feature/profile/data/repo/info_repo.dart';

part 'shipping_state.dart';

class ShippingCubit extends Cubit<ShippingState> {
  ShippingCubit(this.repo) : super(ShippingInitial());
   final InfoRepo repo;

  Future<void> getShippingAndReturn() async {
    emit(ShippingLoading());
    final result = await repo.getShippingAndReturn();
    result.fold(
      (failure) => emit(ShippingError(failure.errMessage)),
      (data) => emit(ShippingSuccess(data)),
    );
  }
}
