import 'dart:convert';
import 'package:clean_archi/features/weather/data/dto/dummy/dummy_dto.dart';
import 'package:clean_archi/features/weather/data/local_source/local_source.dart';
import 'package:flutter/services.dart' show rootBundle;


class WeatherLocalService implements WeatherLocalSource {
  final String assetPath;

  WeatherLocalService(this.assetPath);

  @override
  Future<DummyDto> getDummyData() async {
    try {
      final jsonString = await rootBundle.loadString(assetPath);
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      return DummyDto.fromJson(jsonMap);
    } catch (e) {
      rethrow; 
    }
  }
}
