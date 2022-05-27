class AppRoutes {
  static const home = '/home';
  static const location = '/search/location';
  static const login = '/login';
  static const resetPassword = '/resetPasssword';
  static const search = '/search';
  static const signUp = '/signUp';
  static const weeklyForecast = '/weeklyForecast';
  static const welcome = '/welcome';
}

const String kApiKey = '2c6737e592f84561bda90108221504';
const String kWeatherApiUrl = 'https://api.weatherapi.com/v1';
const String kForecastApiMethod = '/forecast.json';
const String kCurrentWeatherApiMethod = '/current.json';
const String kSearchApiMethod = '/search.json';
