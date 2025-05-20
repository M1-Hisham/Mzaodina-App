import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

import '../view-model/check_box_cubit.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckboxCubit, CheckboxState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            context.read<CheckboxCubit>().toggle();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: SvgPicture.asset(
              state.isChecked ? R.images.checkBoxTrue : R.images.checkBoxFalse,
              height: 25.h,
              width: 25.w,
            ),
          ),
        );
      },
    );
  }
}
