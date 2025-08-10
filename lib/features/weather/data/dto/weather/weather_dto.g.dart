// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponseDTO _$WeatherResponseDTOFromJson(Map<String, dynamic> json) =>
    WeatherResponseDTO(
      coord: json['coord'] == null
          ? null
          : CoordDTO.fromJson(json['coord'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : WeatherDto.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$WeatherResponseDTOToJson(WeatherResponseDTO instance) =>
    <String, dynamic>{'coord': instance.coord, 'weather': instance.weather};

WeatherDto _$WeatherDtoFromJson(Map<String, dynamic> json) => WeatherDto(
  description: json['description'] as String?,
  id: (json['id'] as num?)?.toInt(),
  main: json['main'] as String?,
);

Map<String, dynamic> _$WeatherDtoToJson(WeatherDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
    };
