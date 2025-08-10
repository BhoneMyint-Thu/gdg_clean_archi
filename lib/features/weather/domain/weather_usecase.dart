import 'package:clean_archi/features/weather/domain/entities/dummy.dart';
import 'package:clean_archi/features/weather/domain/entities/error.dart';
import 'package:clean_archi/features/weather/domain/entities/weather.dart';
import 'package:clean_archi/features/weather/domain/weather_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class WeatherUsecase {
  final WeatherRepo _repo;
  WeatherUsecase(this._repo);
  Future<Either<ErrorModel, List<Weather?>>> getWeather({
    required String lat,
    required String lon,
  }) async {
    try {
      final result = await _repo.getWeather(lat: lat, lon: lon);

      return Right(result);
    } on DioException catch (e) {
      return Left(ErrorModel.dio(e));
    } catch (_) {
      return Left(ErrorModel.somethingWentWrong());
    }
  }

  Future<Either<ErrorModel, Dummy>> getDummy() async {
    try {
      final result = await _repo.getDummy();
      return Right(result);
    } catch (_) {
      return Left(ErrorModel.somethingWentWrong());
    }
  }
}
