import 'package:equatable/equatable.dart';
import 'package:ex_weather_bloc/model/WeatherModel.dart';
import 'package:ex_weather_bloc/network/WeatherRepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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


//state

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


//bloc
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  WeatherRepo weatherRepo;

  WeatherBloc(this.weatherRepo) : super(WeatherIsNotSearched());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if(event is FetchWeather){
      yield WeatherIsLoading();

      try{
        print("event: ${event._city}");
        WeatherModel weather = await weatherRepo.getWeather(event._city);
        yield WeatherIsLoaded(weather);
      }catch(_){
        print(_);
        yield WeatherIsNotLoaded();
      }
    }else if(event is ResetWeather){
      yield WeatherIsNotSearched();
    }
  }

}

