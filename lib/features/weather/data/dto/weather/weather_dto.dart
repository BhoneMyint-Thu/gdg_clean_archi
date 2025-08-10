import 'package:clean_archi/features/weather/data/dto/shared/coord_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'weather_dto.g.dart';

@JsonSerializable()
class WeatherResponseDTO {
  final CoordDTO? coord;
  final List<WeatherDto?>? weather;
  WeatherResponseDTO({this.coord, this.weather});
  factory WeatherResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherResponseDTOToJson(this);
}


@JsonSerializable()
class WeatherDto {
  final int? id;
  final String? main;
  final String? description;
  WeatherDto({this.description, this.id, this.main});
  factory WeatherDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherDtoToJson(this);
}
