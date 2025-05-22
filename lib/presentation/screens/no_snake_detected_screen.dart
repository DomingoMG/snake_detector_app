import 'package:flutter/material.dart';
import 'package:snake_detector/domain/entities/response/snake_detector_response.dart';
import 'package:snake_detector/presentation/widgets/detection_result_card.dart';

class NoSnakeDetectedScreen extends StatelessWidget {
  final SnakeDetectorResponse? response;
  static const String pathRoute = '/no-snake-detected';

  const NoSnakeDetectedScreen({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DetectionResultCard(
          message: 'No snake detected.',
          response: response,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          borderColor: Theme.of(context).dividerColor,
          icon: Icons.warning_rounded,
          isNotSnake: true,
        ),
      ),
    );
  }
}
