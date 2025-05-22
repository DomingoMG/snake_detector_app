
import 'package:json_annotation/json_annotation.dart';

part 'snake_detector_response.g.dart';

@JsonSerializable(
  explicitToJson: true
)
class SnakeDetectorResponse {
  SnakeDetectorResponse({
    required this.className,
    required this.confidence,
  });

  @JsonKey(name: 'class')
  final String className;

  @JsonKey(name: 'confidence')
  final double confidence;

  factory SnakeDetectorResponse.fromJson(Map<String, dynamic> json) => _$SnakeDetectorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SnakeDetectorResponseToJson(this);
}