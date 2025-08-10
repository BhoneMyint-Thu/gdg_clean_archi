import 'package:json_annotation/json_annotation.dart';
part 'coord_dto.g.dart';

@JsonSerializable()
class CoordDTO {
  final double? lon;
  final double? lat;
  CoordDTO({this.lat, this.lon});
  factory CoordDTO.fromJson(Map<String, dynamic> json) =>
      _$CoordDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CoordDTOToJson(this);
}
