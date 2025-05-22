

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snake_detector/domain/repositories/snake_detector_repository.dart';
import 'package:snake_detector/infraestructure/repositories_impl/snake_detector_repository_impl.dart';
import 'package:snake_detector/presentation/providers/net_notifier.dart';

final providerApiRepository = NotifierProvider<ApiRepositoryNotifier, SnakeDetectorRepository>(ApiRepositoryNotifier.new);

class ApiRepositoryNotifier extends Notifier<SnakeDetectorRepository> {
  @override
  SnakeDetectorRepository build() {
    return SnakeDetectorRepositoryImpl(ref.watch(providerNetNotifier));
  }
}