import 'package:clean_archi/features/weather/data/dto/dummy/dummy_dto.dart';
import 'package:clean_archi/features/weather/domain/entities/dummy.dart';

extension DummyDtoMapper on DummyDto {
  Dummy toEntity() {
    return Dummy(name: name, event: event);
  }
}
