import 'package:flutter_bloc/flutter_bloc.dart';

class CheckboxState {
  final bool isChecked;

  CheckboxState({required this.isChecked});

  CheckboxState copyWith({bool? isChecked}) {
    return CheckboxState(isChecked: isChecked ?? this.isChecked);
  }
}

class CheckboxCubit extends Cubit<CheckboxState> {
  CheckboxCubit({bool initialValue = false})
    : super(CheckboxState(isChecked: initialValue));

  void toggle() => emit(state.copyWith(isChecked: !state.isChecked));

  void setValue(bool value) => emit(state.copyWith(isChecked: value));
}
