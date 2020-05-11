import 'package:json_annotation/json_annotation.dart';

part 'weather_response.g.dart';

@JsonSerializable(nullable: false, createToJson: false)
class WeatherResponse {
  final MainResponse main;

  WeatherResponse({this.main});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) => _$WeatherResponseFromJson(json);
}

@JsonSerializable(nullable: false, createToJson: false)
class MainResponse {
  final double temp;

  MainResponse({this.temp});

  factory MainResponse.fromJson(Map<String, dynamic> json) => _$MainResponseFromJson(json);
}