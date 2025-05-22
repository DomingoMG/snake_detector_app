
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {

  static final ImagePicker _imagePicker = ImagePicker();

  static Future<XFile?> imagePicker({bool isGallery = true}) async {
    XFile? pickedFile;
    try {  
      pickedFile = await _imagePicker.pickImage(
        source: isGallery ? ImageSource.gallery : ImageSource.camera,
      );
    } catch( error ) {
      debugPrint("Method error: ImagePickerUtils.imagePicker: $error");
    }
    return pickedFile;
  }

}