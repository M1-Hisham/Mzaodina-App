import 'package:flutter_bloc/flutter_bloc.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit() : super(CountryInitial());

  void updateCountry(String flag, String dialCode, String name) {
    emit(CountrySelected(flag: flag, dialCode: dialCode, name: name));
  }
}
