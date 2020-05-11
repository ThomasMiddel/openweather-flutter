import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:get_it/get_it.dart';
import 'package:openweather/data/ow_api.dart';
import 'package:openweather/data/weather/weather_repository.dart';

const DEFAULT_CONNECTION_TIMEOUT = const Duration(seconds: 10);
const DEFAULT_RECEIVE_TIMEOUT = const Duration(seconds: 10);

GetIt sl = GetIt.instance;

class ServiceLocator {
  static Future<void> init() async {
    await _registerNetwork();
    await _registerRepositories();
  }

  /// Register all the networking components
  static Future<void> _registerNetwork() async {
    sl.registerSingleton(_buildDio());
    sl.registerSingleton(OwApi(sl.get<Dio>()));
  }

  static Dio _buildDio() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://community-open-weather-map.p.rapidapi.com',
      connectTimeout: DEFAULT_CONNECTION_TIMEOUT.inMilliseconds,
      receiveTimeout: DEFAULT_RECEIVE_TIMEOUT.inMilliseconds,
    );

    final dio = Dio(options)
      ..transformer = FlutterTransformer()
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options) async {
            options.headers['x-rapidapi-host'] = 'community-open-weather-map.p.rapidapi.com';
            options.headers['x-rapidapi-key'] = 'YOUR_API_KEY'; // TODO Add your API key here
          },
        ),
      );

    return dio;
  }

  /// Register all the repositories
  static Future<void> _registerRepositories() async {
    sl.registerSingleton(WeatherRepository(sl.get()));
  }
}
