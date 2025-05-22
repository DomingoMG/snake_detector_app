

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snake_detector/config/constants/constants.dart';

final providerNetNotifier = NotifierProvider<NetNotifier, Dio>(NetNotifier.new);

class NetNotifier extends Notifier<Dio> {
  final Dio dio = Dio(BaseOptions(
    baseUrl: Constants.baseUrl,
    connectTimeout: Duration(seconds: 15),
  ));

  @override
  Dio build() {
    return dio;
  }
}