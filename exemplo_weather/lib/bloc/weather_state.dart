import 'package:equatable/equatable.dart';
import 'package:exemplo_weather/model/weather_model.dart';

class WeatherState extends Equatable {

  @override
  List<Object> get props => [];

}

class WeatherIsNotSearched extends WeatherState {}

class WeatherIsLoading extends WeatherState { }

class WeatherIsLoaded extends WeatherState {

  final _weather;

  WeatherIsLoaded(this._weather);

  WeatherModel get getWeather => _weather;

  @override
  List<Object> get props {
    return [_weather];
  }
}

class WeatherIsNotLoaded extends WeatherState {
}