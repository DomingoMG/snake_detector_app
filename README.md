# 🐍 Snake Detector App
This mobile app uses a trained machine learning model to detect whether an image contains a **snake** or **not**. It is designed to assist with environmental monitoring and awareness, particularly useful in areas affected by invasive snake species.

Author: Domingo Montesdeoca González
School: I.E.S LOMO DE LA HERRADURA

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

## 🚀 Future Improvements
• Add heatmap visualization using Grad-CAM.
• Improve dataset with more balanced class distribution.
• Integrate live video detection mode.
• Add species-specific detection for invasive snakes.

## 🤝 Contributing
Feel free to open issues or submit PRs to improve the model or app functionality.

## 📝 License
This project is licensed under the MIT License.

Made with ❤️ for biodiversity monitoring and conservation.