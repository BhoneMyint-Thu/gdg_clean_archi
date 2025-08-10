// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coord_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordDTO _$CoordDTOFromJson(Map<String, dynamic> json) => CoordDTO(
  lat: (json['lat'] as num?)?.toDouble(),
  lon: (json['lon'] as num?)?.toDouble(),
);

Map<String, dynamic> _$CoordDTOToJson(CoordDTO instance) => <String, dynamic>{
  'lon': instance.lon,
  'lat': instance.lat,
};
