import 'package:clean_archi/features/weather/domain/entities/dummy.dart';
import 'package:clean_archi/features/weather/domain/entities/weather.dart';

abstract class WeatherRepo {
  Future<List<Weather?>> getWeather({required String lat, required String lon});
  Future<Dummy> getDummy();
}
