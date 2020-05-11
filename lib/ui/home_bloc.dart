import 'package:bloc_provider/bloc_provider.dart';
import 'package:openweather/app/resource.dart';
import 'package:openweather/data/weather/weather.dart';
import 'package:openweather/data/weather/weather_repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc implements Bloc {
  final WeatherRepository _weatherRepository;

  final _weather = BehaviorSubject<Resource<Weather>>.seeded(Resource.loading());
  ValueStream<Resource<Weather>> get weather => _weather.stream;

  HomeBloc(this._weatherRepository) {
    loadWeather();
  }

  Future<void> loadWeather() async {
    _weather.add(Resource.loading());

    try {
      final amsterdamWeather = await _weatherRepository.getWeather('Amsterdam');
      _weather.add(Resource.success(amsterdamWeather));
    } catch (exception) {
      _weather.add(Resource.error(exception));
    }
  }

  @override
  void dispose() {
    _weather.close();
  }
}