import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:snake_detector/domain/entities/response/snake_detector_response.dart';
import 'package:snake_detector/presentation/screens/home_screen.dart';
import 'package:snake_detector/presentation/screens/no_snake_detected_screen.dart';
import 'package:snake_detector/presentation/screens/snake_detected_screen.dart';

final providerAppNavigation = NotifierProvider<AppNavigationNotifier, GoRouter>(AppNavigationNotifier.new);

class AppNavigationNotifier extends Notifier<GoRouter> {
  @override
  GoRouter build() {
    return GoRouter(
      initialLocation: HomeScreen.pathRoute,
      routes: [
        GoRoute(
          path: HomeScreen.pathRoute,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: SnakeDetectedScreen.pathRoute,
          builder: (context, state) => SnakeDetectedScreen(response: state.extra as SnakeDetectorResponse?),
        ),
        GoRoute(
          path: NoSnakeDetectedScreen.pathRoute,
          builder: (context, state) => NoSnakeDetectedScreen(response: state.extra as SnakeDetectorResponse?),
        ),
      ]
    );
  }
}