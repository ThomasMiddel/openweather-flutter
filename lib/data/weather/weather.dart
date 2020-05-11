import 'weather_response.dart';

class Weather {
  final double currentTempterature;

  const Weather({this.currentTempterature});

  factory Weather.fromResponse(WeatherResponse response) => Weather(
        currentTempterature: response.main.temp,
      );
}
