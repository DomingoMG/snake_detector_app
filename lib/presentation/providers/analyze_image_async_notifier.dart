import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snake_detector/domain/entities/response/snake_detector_response.dart';
import 'package:snake_detector/presentation/providers/api_respoitory_notifier.dart';
import 'package:snake_detector/presentation/providers/selected_image_notifier.dart';

final providerAnalyzeImageAsync = AsyncNotifierProvider<AnalyzeImageNotifier, SnakeDetectorResponse?>(AnalyzeImageNotifier.new);

class AnalyzeImageNotifier extends AsyncNotifier<SnakeDetectorResponse?> {
  @override
  Future<SnakeDetectorResponse?> build() async => null;

  Future<void> analyzeImage() async {
    final selectedImage = ref.watch(providerSelectedImage);
    if (selectedImage == null) return;
    state = AsyncLoading();
    final api = ref.read(providerApiRepository);
    final response = await api.detectImage(File(selectedImage.path));
    state = AsyncData(response);
  }
}