<img src="/assets/logo/logo.png" alt="Logo" width="250">

# 🐍 Snake Detector App
This mobile app uses a trained machine learning model to detect whether an image contains a **snake** or **not**. It is designed to assist with environmental monitoring and awareness, particularly useful in areas affected by invasive snake species.

- Author: Domingo Montesdeoca González
- School: I.E.S LOMO DE LA HERRADURA

## 📱 Features
- 📸 Upload or capture an image from your camera.
- 🤖 Uses a trained AI model to predict if the image contains a snake.
- ✅ Returns a clear result: `Snake` or `No Snake`.
- 🗂 Works with JPEG and PNG images.
- 🔒 Offline mode available (depending on model integration).
- 🌍 Can be adapted to specific species or regions (e.g., Lampropeltis californiae in Canary Islands).

## 🧠 Model Information
- Framework: TensorFlow / Keras
- Architecture: MobileNetV2 (lightweight for mobile)
- Binary classification: `snake` vs `no_snake`
- Trained with a custom dataset labeled by experts

## 📦 Installation
```bash
flutter pub get
flutter run
```
Make sure your device/emulator has access to the camera or file system.

## 🧪 Usage
1. Launch the app.
2. Tap "Select Image" to upload or take a photo.
3. Wait a few seconds for the prediction.
4. View the result and confidence score.

## Model Accuracy Examples
### Correct Predictions (Model performed well):
- <img src="/docs/good_1.png" alt="Snake Detected Good 1" width="250">
- <img src="/docs/good_2.png" alt="Snake Detected Good 2" width="250">
- <img src="/docs/good_3.png" alt="Snake Detected Good 3" width="250">
- <img src="/docs/good_4.png" alt="Snake Detected Good 3" width="250">
The model successfully identified the presence or absence of a snake.

### Incorrect Predictions (False Positives):
<img src="/docs/bad_1.png" alt="No Snake Detected Bad 1" width="250"><img src="/docs/bad_2.png" alt="No Snake Detected Bad 2" width="250"><img src="/docs/bad_3.png" alt="No Snake Detected Bad 3" width="250"> <img src="/docs/bad_4.png" alt="No Snake Detected Bad 4" width="250">
The model incorrectly detected a snake due to lack of training examples with toy snakes or similar objects.

🔧 *Recommendation:* Add a new class in the training dataset for **"toy snakes"** or similar misleading objects to reduce false positives and improve accuracy.

## 🚀 Future Improvements
- Add heatmap visualization using Grad-CAM.
- Improve dataset with more balanced class distribution.
- Integrate live video detection mode.
- Add species-specific detection for invasive snakes.

## 🤝 Contributing
Feel free to open issues or submit PRs to improve the model or app functionality.

## 📝 License
This project is licensed under the MIT License.

Made with ❤️ for biodiversity monitoring and conservation.