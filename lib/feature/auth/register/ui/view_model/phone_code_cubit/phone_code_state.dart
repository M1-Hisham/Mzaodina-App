part of 'phone_code_cubit.dart';

sealed class PhoneCodeState {}

final class PhoneCodeInitial extends PhoneCodeState {}

class PhoneCodeSelected extends PhoneCodeState {
  final String flag;
  final String dialCode;

  PhoneCodeSelected({required this.flag, required this.dialCode});
}
