import 'package:clean_archi/features/weather/data/dto/weather/weather_dto.dart';
import 'package:clean_archi/features/weather/data/remote_source/remote_source.dart';

class WeatherRemoteServiceMock implements WeatherRemoteSource {
  @override
  Future<WeatherResponseDTO> getWeather({
    required String lat,
    required String lon,
  }) async {
    return WeatherResponseDTO();
  }
}
