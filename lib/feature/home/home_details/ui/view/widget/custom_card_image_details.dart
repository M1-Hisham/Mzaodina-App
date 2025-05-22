import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/feature/home/home_details/qadim/ui/view_model/image_switcher_cubit/image_switcher_cubit.dart';

class CustomCardImageDetails extends StatelessWidget {
  final List<String> images;

  const CustomCardImageDetails({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageSwitcherCubit(images),
      child: const _ImageSwitcherView(),
    );
  }
}

class _ImageSwitcherView extends StatelessWidget {
  const _ImageSwitcherView();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
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
    return BlocSelector<ImageSwitcherCubit, ImageSwitcherState, String>(
      selector: (state) => state.images[state.selectedIndex],
      builder: (context, imagePath) {
        return Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: CachedNetworkImage(
            imageUrl: imagePath,
            width: double.infinity,
            height: 210.h,
            fit: BoxFit.contain,
            placeholder:
                (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
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
        return Container(
          padding: const EdgeInsets.only(right: 16, left: 16),

          decoration: BoxDecoration(borderRadius: BorderRadius.circular(11)),
          width: double.infinity,
          height: 58.33.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.images.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: _ThumbnailItem(
                  imagePath: state.images[index],
                  index: index,
                  isSelected: state.selectedIndex == index,
                ),
              );
            },
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
      onTap: () => context.read<ImageSwitcherCubit>().switchImage(index),
      child: Container(
        height: 80.h,
        width: 75.w,
        decoration: BoxDecoration(
          border: Border.all(
            color:
                isSelected ? R.colors.primaryColorLight : R.colors.whiteColor2,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(11),
        ),
        child: CachedNetworkImage(
          imageUrl: imagePath,
          width: double.infinity,
          fit: BoxFit.contain,
          placeholder:
              (context, url) => Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
