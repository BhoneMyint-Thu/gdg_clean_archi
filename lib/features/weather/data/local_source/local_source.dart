
import 'package:clean_archi/features/weather/data/dto/dummy/dummy_dto.dart' show DummyDto;

abstract class WeatherLocalSource {
  Future<DummyDto> getDummyData();
}