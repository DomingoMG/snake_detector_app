import 'package:flutter/material.dart';
import 'package:snake_detector/domain/entities/response/snake_detector_response.dart';
import 'package:snake_detector/presentation/widgets/detection_result_card.dart';


class SnakeDetectedScreen extends StatelessWidget {
  final SnakeDetectorResponse? response;
  const SnakeDetectedScreen({super.key, required this.response});
  static const String pathRoute = '/snake-detected';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DetectionResultCard(
          message: 'Snake detected!',
          response: response,
          backgroundColor: const Color.fromARGB(255, 87, 9, 9),
          borderColor: Theme.of(context).dividerColor,
          icon: Icons.check_circle_outline
        ),
      ),
    );
  }
}
