import 'package:ex_weather_bloc/model/WeatherModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherRepo {

  Future<WeatherModel> getWeather(String city) async {

    print("city: ${city}");
    final result = await http.Client().get("https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=43ea6baaad7663dc17637e22ee6f78f2");

    if(result.statusCode != 200)
      throw Exception();

    print("body: ${result.body}");
    return parsedJson(result.body);

  }

  WeatherModel parsedJson(final response) {

    final jsonDecoded = json.decode(response);
    final jsonWeather = jsonDecoded["main"];
    return WeatherModel.fromJson(jsonWeather);

  }
}