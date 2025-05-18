part of 'country_cubit.dart';

abstract class CountryState {}

class CountryInitial extends CountryState {}

class CountrySelected extends CountryState {
  final String flag;
  final String dialCode;
  final String name;

  CountrySelected({
    required this.flag,
    required this.dialCode,
    required this.name,
  });
}
