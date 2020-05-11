import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

import 'weather/weather_response.dart';

part 'ow_api.g.dart';

@RestApi()
abstract class OwApi {
  factory OwApi(Dio dio, {String baseUrl}) = _OwApi;

  @GET('/weather')
  Future<WeatherResponse> getCurrentWeather(
    @Query('q') String location,
  );
}
