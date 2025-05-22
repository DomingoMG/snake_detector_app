import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final providerSelectedImage = NotifierProvider<SelectedImageNotifier, XFile?>(SelectedImageNotifier.new);

class SelectedImageNotifier extends Notifier<XFile?> {
  @override
  XFile? build() {
    return null;
  }

  set setImage(XFile? image) {
    state = image;
  }
}