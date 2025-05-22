
import 'dart:io';
import 'package:snake_detector/domain/entities/response/snake_detector_response.dart';

abstract class SnakeDetectorRepository {
  Future<SnakeDetectorResponse> detectImage(File request);
}