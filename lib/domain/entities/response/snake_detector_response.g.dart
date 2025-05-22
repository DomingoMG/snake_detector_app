// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snake_detector_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SnakeDetectorResponse _$SnakeDetectorResponseFromJson(
  Map<String, dynamic> json,
) => SnakeDetectorResponse(
  className: json['class'] as String,
  confidence: (json['confidence'] as num).toDouble(),
);

Map<String, dynamic> _$SnakeDetectorResponseToJson(
  SnakeDetectorResponse instance,
) => <String, dynamic>{
  'class': instance.className,
  'confidence': instance.confidence,
};
