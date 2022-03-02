import 'package:exemplo_weather/model/weather_model.dart';
import 'package:exemplo_weather/repository/weather_repository.dart';
import 'package:exemplo_weather/bloc/weather_event.dart';
import 'package:exemplo_weather/bloc/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  WeatherRepo weatherRepo;

  WeatherBloc(this.weatherRepo) : super(WeatherIsNotSearched());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {

    if(event is FetchWeather) {
      yield WeatherIsLoading();

      try {
        print("AQUI:");
        print("eventttt: ${event.props[0].toString()}");
        WeatherModel weather = await weatherRepo.getWeather(event.props[0].toString());
        yield WeatherIsLoaded(weather);
      } catch(_) {
        print(_);
        yield WeatherIsNotLoaded();
      }
    } else if(event is ResetWeather) {
      yield WeatherIsNotSearched();
    }
  }

}