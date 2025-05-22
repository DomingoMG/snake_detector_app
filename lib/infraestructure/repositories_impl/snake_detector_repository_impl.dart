import 'dart:io';

import 'package:dio/dio.dart';
import 'package:snake_detector/config/constants/constants.dart';
import 'package:snake_detector/domain/datasources/snake_detector_api_client_datasource.dart';
import 'package:snake_detector/domain/entities/response/snake_detector_response.dart';
import 'package:snake_detector/domain/repositories/snake_detector_repository.dart';

class SnakeDetectorRepositoryImpl extends SnakeDetectorRepository {
  SnakeDetectorRepositoryImpl(this.dio);
  final Dio dio;

  @override
  Future<SnakeDetectorResponse> detectImage(File request) async {
    final api = SnakeDetectorApiClient(dio, baseUrl: Constants.baseUrl);
    try {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(request.path, filename: 'image.jpg'),
    });
      final result = await api.detectImage(formData);
      switch( result.response.statusCode ){
        case 200:
          return result.data;
        default:
          throw Exception('Error when analyzing the image');
      }
    } on DioException {
      rethrow;
    }
  }
}