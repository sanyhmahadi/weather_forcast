import 'package:flutter/material.dart';
import 'package:weather_forcast/weather_forcast/ui/mid_view.dart';
import 'model/weather_forcast_model.dart';
import 'network/network.dart';

class Weatherforcast extends StatefulWidget {
  @override
  _WeatherforcastState createState() => _WeatherforcastState();
}

class _WeatherforcastState extends State<Weatherforcast> {
  Future<WeatherForcastModel> forcastObject;
  String _cityName = "Mumbai";
  @override
  void initState() {
    super.initState();
    forcastObject = Network().getWeatherForcast(cityName: _cityName);
    // forcastObject.then((weather) {
    //   print(weather.list[0].weather[0].main);
    // });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          textFieldView(),
          Container(
              child: FutureBuilder<WeatherForcastModel>(
            future: forcastObject,
            builder: (BuildContext context,
                AsyncSnapshot<WeatherForcastModel> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    midView(snapshot),
                  ],
                );
              } else {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ))
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
            hintText: "Enter the City Name",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.all(8)),
        onSubmitted: (value) {},
      ),
    );
  }
}
