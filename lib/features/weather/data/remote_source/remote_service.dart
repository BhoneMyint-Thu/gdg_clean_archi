import 'package:clean_archi/core/utils/dio_util.dart';
import 'package:clean_archi/features/weather/data/dto/weather/weather_dto.dart';

import 'package:clean_archi/core/api_constants.dart';
import 'package:clean_archi/features/weather/data/remote_source/remote_source.dart';
import 'package:dio/dio.dart';


class WeatherRemoteService implements WeatherRemoteSource {
  WeatherRemoteService(this._dio);
  final Dio _dio;

  @override
  Future<WeatherResponseDTO> getWeather({
    required String lat,
    required String lon,
  }) async {
    try {
      final response = await DioUtil.getAPI(
        "/${ApiConstants.weather}",
        dio: _dio,
        queryParam: {
          "lat": lat,
          "lon": lon,
          "appid": "Your Open Weather Map api key",
        },
      );
      return WeatherResponseDTO.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    } catch (_) {
      rethrow;
    }
  }

}
