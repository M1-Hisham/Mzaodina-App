import 'package:flutter_bloc/flutter_bloc.dart';

part 'image_switcher_state.dart';

class ImageSwitcherCubit extends Cubit<ImageSwitcherState> {
  ImageSwitcherCubit(List<String> initialImages)
    : super(ImageSwitcherInitial(initialImages));

  void switchImages(int index) {
    if (index >= 0 && index < state.images.length) {
      // إنشاء نسخة جديدة من القائمة
      final newImages = List<String>.from(state.images);

      // تبديل الصورة الأولى مع الصورة المحددة
      final temp = newImages[0];
      newImages[0] = newImages[index];
      newImages[index] = temp;

      emit(ImageSwitcherUpdated(newImages, index));
    }
  }
}
