import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

import 'weather/weather_response.dart';

part 'ow_api.g.dart';

@RestApi(baseUrl: "https://community-open-weather-map.p.rapidapi.com")
abstract class OwApi {
  factory OwApi(Dio dio, {String baseUrl}) = _OwApi;

  @GET("/weather")
  @Headers(<String, String>{
    "x-rapidapi-host": "community-open-weather-map.p.rapidapi.com",
    "x-rapidapi-key": "9100e383f4msh72f066e78203fbdp181e60jsn74e9a0ec70b8"
  })
  Future<WeatherResponse> getCurrentWeather(
    @Query('q') String location,
  );
}
