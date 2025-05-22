import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:snake_detector/infraestructure/utils/image_picker_utils.dart';
import 'package:snake_detector/presentation/providers/analyze_image_async_notifier.dart';
import 'package:snake_detector/presentation/providers/selected_image_notifier.dart';
import 'package:snake_detector/presentation/providers/theme_mode_notifier.dart';
import 'package:snake_detector/presentation/screens/no_snake_detected_screen.dart';
import 'package:snake_detector/presentation/screens/snake_detected_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  static const String pathRoute = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeController = ref.read(providerThemeMode.notifier);
    ref.listen(providerAnalyzeImageAsync, (previous, next) {
      if( next.isLoading ) return;
      if( next.hasError ) {
        final messenger = ScaffoldMessenger.of(context);
        messenger.showSnackBar(SnackBar(
          content: Text('Unable to connect to the server. Please try again later.'),
          duration: const Duration(seconds: 3),
        ));
        return;
      }
      if( next.hasValue ) {
        final response = next.value;
        if( response?.className == 'snake' ) {
          context.push(SnakeDetectedScreen.pathRoute, extra: response);
        } else if ( response?.className == 'no_snake' ) {
          context.push(NoSnakeDetectedScreen.pathRoute, extra: response);
        }
      }
    });
    return Scaffold(
      appBar: AppBar(title: const Text('Snake Detector')),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Consumer(
              builder: (context, ref, child) {
                final analyzeImageController = ref.read(providerAnalyzeImageAsync.notifier);
                return ref.watch(providerAnalyzeImageAsync).when(
                  data: (response) {
                    return Column(
                      children: [
                        Gap(20),
                        Consumer(
                          builder: (context, ref, child) {
                            final selectedImage = ref.watch(providerSelectedImage);
                            return FadeIn(
                              delay: Duration(milliseconds: 750),
                              child: Container(
                                constraints: BoxConstraints(
                                  minWidth: 320,
                                  maxHeight: 320,
                                  maxWidth: 320,
                                  minHeight: 320,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 3,
                                    color: Theme.of(context).dividerColor,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  image:
                                      selectedImage == null
                                          ? null
                                          : DecorationImage(
                                            image: FileImage(File(selectedImage.path)),
                                            fit: BoxFit.cover,
                                          ),
                                ),
                                child: Visibility(
                                  visible: selectedImage == null,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [Text('Image not found')],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                    
                        Gap(20),
                        Consumer(
                          builder: (context, ref, child) {
                            final selectedImage = ref.watch(providerSelectedImage);
                            return AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child:
                                  selectedImage == null
                                      ? const SizedBox()
                                      : FadeInRightBig(
                                        delay: Duration(milliseconds: 250),
                                        child: SafeArea(
                                          minimum: const EdgeInsets.symmetric(
                                            horizontal: 26,
                                          ),
                                          child: Container(
                                            constraints: BoxConstraints(
                                              minWidth: 300,
                                              maxWidth: 450,
                                            ),
                                            child: ElevatedButton(
                                              onPressed: analyzeImageController.analyzeImage,
                                              child: const Text('Analyze Image'),
                                            ),
                                          ),
                                        ),
                                      ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                  error: (error, stackTrace) => Text('Unexpected error: ${error.toString()}'),
                  loading: () => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [         
                      const Gap(20),
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: const CircularProgressIndicator(strokeWidth: 3.0,),
                      ),
                    ],
                  ),
                );
              }
            ),
          ),
        ],
      ),
      floatingActionButton: Wrap(
        direction: Axis.vertical,
        spacing: 12,
        children: [
          FadeInRightBig(
            delay: const Duration(milliseconds: 150),
            child: FloatingActionButton.extended(
              heroTag: 'open-gallery',
              onPressed: () async {
                final xFile = await ImagePickerUtils.imagePicker();
                ref.read(providerSelectedImage.notifier).setImage = xFile;
              },
              label: const Text('Open Gallery'),
              icon: Icon(Icons.photo_library),
            ),
          ),
          FadeInRightBig(
            delay: const Duration(milliseconds: 300),
            child: FloatingActionButton.extended(
              heroTag: 'open-camera',
              onPressed: () async {
                final xFile = await ImagePickerUtils.imagePicker(
                  isGallery: false,
                );
                ref.read(providerSelectedImage.notifier).setImage = xFile;
              },
              label: const Text('Open Camera'),
              icon: Icon(Icons.camera_alt),
            ),
          ),
          FadeInRightBig(
            delay: const Duration(milliseconds: 450),
            child: FloatingActionButton.extended(
              heroTag: 'change-theme',
              onPressed: themeModeController.toggleTheme,
              label: const Text('Change Theme'),
              icon: Consumer(
                builder: (context, ref, child) {
                  final themeMode = ref.watch(providerThemeMode);
                  return Icon(
                    themeMode == ThemeMode.dark
                        ? Icons.light_mode
                        : Icons.dark_mode,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
