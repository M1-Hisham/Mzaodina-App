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

  void toggle() {
  final newValue = !state.isChecked;
  print('Checkbox toggled to $newValue');
  emit(state.copyWith(isChecked: newValue));
}

  void setValue(bool value) => emit(state.copyWith(isChecked: value));
}
