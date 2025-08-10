import 'package:clean_archi/features/weather/data/dto/weather/weather_dto.dart';
import 'package:clean_archi/features/weather/domain/entities/weather.dart';
/// use preferred one
Weather toWeatherEntity(WeatherDto? weather) => Weather(
  id: weather?.id,
  description: weather?.description,
  main: weather?.main,
);

extension WeatherDtoMapper on WeatherDto {
  Weather toEntity() => Weather(
    id: id ?? 0,
    main: main ?? '',
    description: description ?? '',
  );
}