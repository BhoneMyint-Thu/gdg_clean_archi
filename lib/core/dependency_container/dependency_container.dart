import 'package:clean_archi/core/utils/asset_manager_util.dart';
import 'package:clean_archi/features/weather/data/local_source/local_service.dart';
import 'package:clean_archi/features/weather/data/remote_source/remote_service.dart';
import 'package:clean_archi/features/weather/data/repo_impl/weather_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio =
      Dio(
          BaseOptions(
            baseUrl: 'https://api.openweathermap.org/data/2.5',
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ),
        )
        ..interceptors.add(
          LogInterceptor(
            requestBody: kDebugMode ? true : false,
            responseBody: kDebugMode ? true : false,
            requestHeader: kDebugMode ? true : false,
          ),
        );

  return dio;
});


final weatherRepoProvider = Provider(
  (ref) => WeatherRepoImpl(WeatherRemoteService(ref.read(dioProvider)),WeatherLocalService(JsonAssetManager.dummy)),
);
