
import 'package:flutter_bloc/flutter_bloc.dart';

part 'phone_code_state.dart';

class PhoneCodeCubit extends Cubit<PhoneCodeState> {
  PhoneCodeCubit() : super(PhoneCodeInitial());
   void updatePhoneCode(String flag, String dialCode) {
    emit(PhoneCodeSelected(flag: flag, dialCode: dialCode));
  }
}
