part of 'weather_provider.dart';

sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherLoaded extends WeatherState {
  final List<Weather?> weather;
  WeatherLoaded(this.weather);
}

final class WeatherError extends WeatherState {
  final ErrorModel error;
  WeatherError(this.error);
}

final class DummyLoading extends WeatherState {}

final class DummyLoaded extends WeatherState {
  final Dummy dummy;
  DummyLoaded(this.dummy);
}

final class DummyError extends WeatherState {
  final ErrorModel error;
  DummyError(this.error);
}
