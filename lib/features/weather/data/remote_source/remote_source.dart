
import 'package:clean_archi/features/weather/data/dto/weather/weather_dto.dart';

abstract class WeatherRemoteSource {
  Future<WeatherResponseDTO> getWeather({
    required String lat,
    required String lon,
  });
}