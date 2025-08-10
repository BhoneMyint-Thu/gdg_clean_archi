import 'package:clean_archi/features/weather/data/dto/dummy/dummy_mapper.dart';
import 'package:clean_archi/features/weather/data/dto/weather/weather_mapper.dart';
import 'package:clean_archi/features/weather/data/local_source/local_source.dart';
import 'package:clean_archi/features/weather/data/remote_source/remote_source.dart';
import 'package:clean_archi/features/weather/domain/entities/dummy.dart';
import 'package:clean_archi/features/weather/domain/entities/weather.dart';
import 'package:clean_archi/features/weather/domain/weather_repo.dart';
import 'package:dio/dio.dart';

class WeatherRepoImpl implements WeatherRepo {
  final WeatherRemoteSource _remoteSource;
  final WeatherLocalSource _localSource;
  WeatherRepoImpl(this._remoteSource,this._localSource);
  @override
  Future<List<Weather?>> getWeather({
    required String lat,
    required String lon,
  }) async {
    try {
      final response = await _remoteSource.getWeather(lat: lat, lon: lon);
      return response.weather?.map((e) => e?.toEntity()).toList() ?? [];
    } on DioException catch (_) {
      rethrow;
    }
  }
   @override
  Future<Dummy> getDummy() async {
    try {
      final response = await _localSource.getDummyData();
      return response.toEntity();
    } on DioException catch (_) {
      rethrow;
    }
  }
}
