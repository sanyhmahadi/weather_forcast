import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forcast/weather_forcast/model/weather_forcast_model.dart';
import 'package:weather_forcast/weather_forcast/util/convert_icon.dart';
import 'package:weather_forcast/weather_forcast/util/util.dart';

Widget forcastCard(AsyncSnapshot<WeatherForcastModel> snapshot, int index) {
  var forcastList = snapshot.data.list; //ei dik a list ar index pathano hoise
  var dayOfWeek = "";
  var fullDate = Util.getFormatteDate(
      new DateTime.fromMillisecondsSinceEpoch(forcastList[index].dt * 1000));
  dayOfWeek = fullDate.split(",")[0];
  //that means at first it will spilt ta date like suppose sunday,20feb,2021 and
  //[0]means will the first string that means sunday

  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(dayOfWeek),
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: Center(
                    child: getWeatherIcon(
                        weatherDescription: forcastList[index].weather[0].main,
                        // forcastList mane holo dataset er List namok option ta and
                        //forcastList[index] holo
                        color: Colors.pinkAccent),
                  )),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                          "${forcastList[index].temp.min.toStringAsFixed(0)}°F",
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold)),
                    ),
                    Icon(
                      FontAwesomeIcons.solidArrowAltCircleDown,
                      size: 18,
                      color: Colors.brown,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(
                          "${forcastList[index].temp.max.toStringAsFixed(0)}°F",
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold)),
                      Icon(
                        FontAwesomeIcons.solidArrowAltCircleUp,
                        size: 18,
                        color: Colors.brown,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(
                          "Humidity:${forcastList[index].humidity.toStringAsFixed(0)}%",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      // Icon(
                      //   FontAwesomeIcons.solidGrinBeamSweat,
                      //   size: 18,
                      //   color: Colors.white,
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(
                          "Wind:${forcastList[index].speed.toStringAsFixed(1)} mil/h",
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold)),
                      // Icon(
                      //   FontAwesomeIcons.wind,
                      //   size: 18,
                      //   color: Colors.white,
                      // ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ]);
}
