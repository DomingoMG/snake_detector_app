
import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {

  static final ImagePicker _imagePicker = ImagePicker();

  static Future<XFile?> imagePicker({bool isGallery = true}) async {
    final pickedFile = await _imagePicker.pickImage(
      source: isGallery ? ImageSource.gallery : ImageSource.camera,
    );
    return pickedFile;
  }

}