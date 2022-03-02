import 'package:equatable/equatable.dart';

class WeatherEvent extends Equatable {

  @override
  List<Object> get props => [];

}

class FetchWeather extends WeatherEvent {
  final _city;

  FetchWeather(this._city);

  @override
  List<Object> get props {
    return [_city];
  }
}

class ResetWeather extends WeatherEvent { }