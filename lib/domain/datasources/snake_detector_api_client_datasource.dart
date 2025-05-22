import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:snake_detector/config/constants/constants.dart';
import 'package:snake_detector/domain/entities/response/snake_detector_response.dart';

part 'snake_detector_api_client_datasource.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class SnakeDetectorApiClient {
  factory SnakeDetectorApiClient(Dio dio, {String? baseUrl, ParseErrorLogger? errorLogger}) = _SnakeDetectorApiClient;

  @POST('/v1/snake-detector/detect')
  @MultiPart()
  Future<HttpResponse<SnakeDetectorResponse>> detectImage(@Body() FormData formData);
}
