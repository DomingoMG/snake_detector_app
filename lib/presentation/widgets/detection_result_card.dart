import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:snake_detector/domain/entities/response/snake_detector_response.dart';
import 'package:snake_detector/presentation/providers/selected_image_notifier.dart';

class DetectionResultCard extends ConsumerWidget {
  final String message;
  final SnakeDetectorResponse? response;
  final Color backgroundColor;
  final Color borderColor;
  final IconData icon;
  final bool isNotSnake;

  const DetectionResultCard({
    super.key,
    required this.message,
    required this.response,
    required this.backgroundColor,
    required this.borderColor,
    required this.icon,
    this.isNotSnake = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Detectar si el color tiene un brillo alto
    final isDark = backgroundColor.computeLuminance() < 0.5;
    final selectedImage = ref.read(providerSelectedImage);
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: backgroundColor,
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BackButton(
                  color: isDark ? Colors.white : Colors.black,
                ),
                Text('Back', style: TextStyle(color: isDark ? Colors.white : Colors.black)),
              ],
            ),
            if (selectedImage != null) ...[
              const Gap(32),
              Container(
                height: 320,
                width: 320,
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: borderColor),
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: FileImage(File(selectedImage.path)),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            const Gap(24),
            Icon(icon, size: 64, color: isDark ? Colors.white : Colors.black),
            const Gap(24),
            Text(
              '${((response?.confidence ?? 0)*100).toStringAsFixed(1)}%',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: isDark ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(12),
            Text(
              message,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: isDark ? Colors.white70 : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
