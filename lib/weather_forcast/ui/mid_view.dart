import 'package:flutter/widgets.dart';
import 'package:weather_forcast/weather_forcast/model/weather_forcast_model.dart';
import 'package:weather_forcast/weather_forcast/util/util.dart';

Widget midView(AsyncSnapshot<WeatherForcastModel> snapshot) {
  var forcastList = snapshot.data.list;
  var formatteDate =
      (new DateTime.fromMillisecondsSinceEpoch(forcastList[0].dt * 1000));
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${city(snapshot)},${country(snapshot)},",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text("${Util.getFormatteDate(formatteDate)}"),
        ],
      ),
    ),
  );
  return midView;
}

String country(AsyncSnapshot<WeatherForcastModel> snapshot) =>
    snapshot.data.city.country;

String city(AsyncSnapshot<WeatherForcastModel> snapshot) =>
    snapshot.data.city.name;
