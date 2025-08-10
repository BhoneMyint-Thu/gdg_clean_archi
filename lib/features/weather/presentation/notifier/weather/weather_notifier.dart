part of 'weather_provider.dart';

class WeatherNotifier extends AutoDisposeNotifier<WeatherState> {
  WeatherUsecase? _usecase;
  @override
  WeatherState build() {
    _usecase = ref.read(weatherUsecaseProvdier);
    return WeatherInitial();
  }

  void getWeather({required String lat, required String lon}) async {
    try {
      state = WeatherLoading();
      final result = await _usecase?.getWeather(lat: lat, lon: lon);
      result?.fold(
        (error) => state = WeatherError(error),
        (data) => state = WeatherLoaded(data),
      );
    } catch (_) {
      state = WeatherError(ErrorModel.somethingWentWrong());
    }
  }
}

class DummyNotifier extends AutoDisposeNotifier<WeatherState> {
  WeatherUsecase? _usecase;
  @override
  WeatherState build() {
    _usecase = ref.read(weatherUsecaseProvdier);
    return WeatherInitial();
  }

  void getDummy() async {
    try {
      state = DummyLoading();
      final result = await _usecase?.getDummy();
      result?.fold(
        (error) => state = DummyError(error),
        (data) => state = DummyLoaded(data),
      );
    } catch (_) {
      state = DummyError(ErrorModel.somethingWentWrong());
    }
  }
}
