import '../ow_api.dart';
import 'weather.dart';

class WeatherRepository {
  final OwApi api;

  WeatherRepository(this.api);

  /// Get the current weather
  Future<Weather> getWeather(String location) async {
    final weatherResponse = await api.getCurrentWeather(location);
    return Weather.fromResponse(weatherResponse);
  }
}
