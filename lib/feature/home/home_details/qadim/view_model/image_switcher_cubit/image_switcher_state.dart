part of 'image_switcher_cubit.dart';

sealed class ImageSwitcherState {
  final List<String> images;
  final int selectedIndex;

  const ImageSwitcherState(this.images, this.selectedIndex);
}

final class ImageSwitcherInitial extends ImageSwitcherState {
  const ImageSwitcherInitial(List<String> images) : super(images, 0);
}

final class ImageSwitcherUpdated extends ImageSwitcherState {
  const ImageSwitcherUpdated(super.images, super.selectedIndex);
}
