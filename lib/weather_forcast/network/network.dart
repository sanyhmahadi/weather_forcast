import 'dart:convert';
import 'package:http/http.dart';
import 'package:weather_forcast/weather_forcast/model/weather_forcast_model.dart';
import 'package:weather_forcast/weather_forcast/util/util.dart';

class Network {
  Future<WeatherForcastModel> getWeatherForcast({String cityName}) async {
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast/daily?q=" +
        cityName +
        "&appid=" +
        Util.appId +
        "&units=imperial"; //i can change imoerial to metric
    final response = await get(Uri.encodeFull(finalUrl));
    print("URL: ${Uri.encodeFull(finalUrl)}");

    if (response.statusCode == 200) {
      print("Weather Data: ${response.body}");
      return WeatherForcastModel.fromJson(jsonDecode(
          response.body)); //we will get actual model object(dart object)
    } else {
      throw Exception("Erron getting weather forcast");
    }
  }
}
