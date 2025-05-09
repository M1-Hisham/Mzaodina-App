import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/view_model/image_switcher_cubit/image_switcher_cubit.dart';

class CustomCardImageDetails extends StatelessWidget {
  final List<String> initialImages;

  const CustomCardImageDetails({super.key, required this.initialImages});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageSwitcherCubit(initialImages),
      child: const _ImageSwitcherView(),
    );
  }
}

class _ImageSwitcherView extends StatelessWidget {
  const _ImageSwitcherView();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: [
          const _MainImageView(),
          SizedBox(height: 18.h),
          const _ThumbnailsRow(),
        ],
      ),
    );
  }
}

class _MainImageView extends StatelessWidget {
  const _MainImageView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageSwitcherCubit, ImageSwitcherState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 8,
            right: 16,
            left: 16,
            bottom: 18,
          ),
          child: Image.asset(
            state.images[0],
            width: double.infinity,
            height: 180.h,
            fit: BoxFit.contain,
          ),
        );
      },
    );
  }
}

class _ThumbnailsRow extends StatelessWidget {
  const _ThumbnailsRow();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageSwitcherCubit, ImageSwitcherState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 1; i < state.images.length; i++)
                _ThumbnailItem(
                  imagePath: state.images[i],
                  index: i,
                  isSelected:
                      state is ImageSwitcherUpdated && state.selectedIndex == i,
                ),
            ],
          ),
        );
      },
    );
  }
}

class _ThumbnailItem extends StatelessWidget {
  final String imagePath;
  final int index;
  final bool isSelected;

  const _ThumbnailItem({
    required this.imagePath,
    required this.index,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<ImageSwitcherCubit>().switchImages(index),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6.w),
        height: 80.h,
        width: 75.w,
        decoration: BoxDecoration(
          border: Border.all(
            color:
                isSelected ? R.colors.primaryColorLight : R.colors.whiteColor2,
            width: 1.w,
          ),
          // color: R.colors.blackColor2,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
