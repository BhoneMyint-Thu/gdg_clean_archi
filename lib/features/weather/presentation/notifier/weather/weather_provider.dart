import 'package:clean_archi/core/dependency_container/dependency_container.dart';
import 'package:clean_archi/features/weather/domain/entities/dummy.dart';
import 'package:clean_archi/features/weather/domain/entities/error.dart';
import 'package:clean_archi/features/weather/domain/entities/weather.dart';
import 'package:clean_archi/features/weather/domain/weather_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'weather_notifier.dart';
part 'weather_state.dart';

final weatherUsecaseProvdier = AutoDisposeProvider(
  (ref) => WeatherUsecase(ref.read(weatherRepoProvider)),
);

final weatherNotifierProvider = AutoDisposeNotifierProvider<WeatherNotifier,WeatherState>(
  WeatherNotifier.new,
);

final dummyNotifierProvider=AutoDisposeNotifierProvider<DummyNotifier,WeatherState>(
  DummyNotifier.new,
);