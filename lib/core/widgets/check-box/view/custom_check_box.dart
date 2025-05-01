import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

import '../view-model/check_box_cubit.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckboxCubit, CheckboxState>(
      builder: (context, state) {
        return Checkbox(
          checkColor: R.colors.whiteLight,
          activeColor: R.colors.primaryColorLight,
          side: BorderSide(color: R.colors.borderColorsLight),
          value: state.isChecked,
          onChanged: (_) => context.read<CheckboxCubit>().toggle(),
        );
      },
    );
  }
}
