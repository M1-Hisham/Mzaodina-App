import 'package:flutter_bloc/flutter_bloc.dart';

part 'image_switcher_state.dart';

class ImageSwitcherCubit extends Cubit<ImageSwitcherState> {
  ImageSwitcherCubit(List<String> initialImages)
    : super(ImageSwitcherInitial(initialImages));

  void switchImage(int index) {
    if (index >= 0 && index < state.images.length) {
      emit(ImageSwitcherUpdated(state.images, index));
    }
  }
}
