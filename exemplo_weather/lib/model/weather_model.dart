class WeatherModel {

  final temp;
  final pressure;
  final humidity;
  final tempMax;
  final tempMin;

  double get getTemp => temp-272.5;
  double get getMaxTemp => tempMax-272.5;
  double get getMinTemp=> tempMin -272.5;

  WeatherModel(this.temp, this.pressure, this.humidity, this.tempMax, this.tempMin);

  factory WeatherModel.fromJson(Map<String, dynamic> json) {

    return WeatherModel(
        json["temp"],
        json["pressure"],
        json["humidity"],
        json["temp_max"],
        json["temp_min"]
    );
  }
}

/*
https://api.openweathermap.org/data/2.5/weather?q=new%20york&APPID=43ea6baaad7663dc17637e22ee6f78f2

{"coord":{"lon":-74.006,"lat":40.7143}
,
"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}]
,
"base":"stations"
,
"main":{"temp":273.27,"feels_like":269.94,"temp_min":272.59,"temp_max":274.26
        ,"pressure":996,"humidity":86},"visibility":10000,

"wind":{"speed":1.54,"deg":0},"clouds":{"all":90},"dt":1612319965
,
"sys":{"type":1,"id":4610,"country":"US","sunrise":1612267490,"sunset":1612304079}
,
"timezone":-18000,"id":5128581,"name":"New York","cod":200}
* */