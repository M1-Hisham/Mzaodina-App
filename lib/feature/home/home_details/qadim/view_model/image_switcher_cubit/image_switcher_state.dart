part of 'image_switcher_cubit.dart';

sealed class ImageSwitcherState {
  final List<String> images;
  final int selectedIndex;

  const ImageSwitcherState(this.images, this.selectedIndex);
}

/// الحالة الابتدائية عند فتح الـ Widget لأول مرة
final class ImageSwitcherInitial extends ImageSwitcherState {
  const ImageSwitcherInitial(List<String> images) : super(images, 0);
}

/// الحالة المحدثة بعد اختيار صورة جديدة
final class ImageSwitcherUpdated extends ImageSwitcherState {
  const ImageSwitcherUpdated(super.images, super.selectedIndex);
}
