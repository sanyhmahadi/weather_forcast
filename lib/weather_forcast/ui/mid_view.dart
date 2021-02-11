import 'package:flutter/widgets.dart';
import 'package:weather_forcast/weather_forcast/model/weather_forcast_model.dart';

Widget midView(AsyncSnapshot<WeatherForcastModel> snapshot) {
  var forcastList = snapshot.data.list;
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${snapshot.data.city.name},${snapshot.data.city.country},",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
  return midView;
}
