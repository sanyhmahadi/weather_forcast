import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_forcast/weather_forcast/model/weather_forcast_model.dart';
import 'package:weather_forcast/weather_forcast/util/convert_icon.dart';
import 'package:weather_forcast/weather_forcast/util/util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//best way to do this code with stless widget
class MidView extends StatelessWidget {
  final AsyncSnapshot<WeatherForcastModel> snapshot;

  const MidView({Key key, this.snapshot}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var forcastList = snapshot.data.list;
    var forcast = forcastList[0];
    var formatteDate =
        (new DateTime.fromMillisecondsSinceEpoch(forcast.dt * 1000));

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${city(snapshot)},${country(snapshot)},",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text("${Util.getFormatteDate(formatteDate)}"),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: getWeatherIcon(
                weatherDescription: forcastList[0].weather[0].main,
                size: 195,
                color: Colors.pinkAccent,
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${forcastList[0].temp.day.toStringAsFixed(0)}°F ",
                    style: TextStyle(fontSize: 34),
                  ),
                  Text(
                    "${forcastList[0].weather[0].description.toUpperCase()}",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${forcastList[0].speed.toStringAsFixed(1)} mi/h"),
                        Icon(
                          FontAwesomeIcons.wind,
                          size: 20,
                          color: Colors.brown,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${forcastList[0].humidity.toStringAsFixed(0)} %"),
                        Icon(
                          FontAwesomeIcons.temperatureHigh,
                          size: 20,
                          color: Colors.brown,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${forcastList[0].temp.max}°F"),
                        Icon(
                          FontAwesomeIcons.solidGrinBeamSweat,
                          size: 20,
                          color: Colors.brown,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//this an another way of mid view without stless widget

// Widget midView(AsyncSnapshot<WeatherForcastModel> snapshot) {
//   var forcastList = snapshot.data.list;
//   var formatteDate =
//       (new DateTime.fromMillisecondsSinceEpoch(forcastList[0].dt * 1000));
//   var forcast = forcastList[0];
//   Container midView = Container(
//     child: Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             "${city(snapshot)},${country(snapshot)},",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//           ),
//           Text("${Util.getFormatteDate(formatteDate)}"),
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: getWeatherIcon(
//               weatherDescription: forcastList[0].weather[0].main,
//               size: 195,
//               color: Colors.pinkAccent,
//             ),
//           ),
//           Divider(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "${forcastList[0].temp.day.toStringAsFixed(0)}°F ",
//                   style: TextStyle(fontSize: 34),
//                 ),
//                 Text(
//                   "${forcastList[0].weather[0].description.toUpperCase()}",
//                   style: TextStyle(fontSize: 20),
//                 )
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("${forcastList[0].speed.toStringAsFixed(1)} mi/h"),
//                       Icon(
//                         FontAwesomeIcons.wind,
//                         size: 20,
//                         color: Colors.brown,
//                       ),
//                       /*Icon(
//                         Icons.arrow_forward,
//                         size: 20,
//                         color: Colors.brown,
//                       ),*/
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("${forcastList[0].humidity.toStringAsFixed(0)} %"),
//                       Icon(
//                         FontAwesomeIcons.temperatureHigh,
//                         size: 20,
//                         color: Colors.brown,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("${forcastList[0].temp.max}°F"),
//                       Icon(
//                         FontAwesomeIcons.solidGrinBeamSweat,
//                         size: 20,
//                         color: Colors.brown,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
//   return midView;
// }

String country(AsyncSnapshot<WeatherForcastModel> snapshot) =>
    snapshot.data.city.country;

String city(AsyncSnapshot<WeatherForcastModel> snapshot) =>
    snapshot.data.city.name;
