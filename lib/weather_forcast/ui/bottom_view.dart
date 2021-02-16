import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_forcast/weather_forcast/model/weather_forcast_model.dart';
import 'package:weather_forcast/weather_forcast/ui/forcast_card.dart';

////best way to do this code with stless widget

class BottomView extends StatelessWidget {
  final AsyncSnapshot<WeatherForcastModel> snapshot;

  const BottomView({Key key, this.snapshot}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("7-Days Weather Forcast",
            style: TextStyle(fontSize: 14, color: Colors.black87)),
        Divider(),
        Container(
            height: 170,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 8,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.list.length,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.3,
                  height: 160,
                  child: forcastCard(snapshot, index),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color(0xff9661C3),
                    Colors.white,
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                ),
              ),
            )),
        Divider(),
      ],
    );
  }
}

////this an another way of mid view without stless widget
// Widget bottomView(
//     AsyncSnapshot<WeatherForcastModel> snapshot, BuildContext context) {
//   var forcastList = snapshot.data.list;
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       Text("7-Days Weather Forcast",
//           style: TextStyle(fontSize: 14, color: Colors.black87)),
//       Divider(),
//       Container(
//           height: 170,
//           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
//           child: ListView.separated(
//             separatorBuilder: (context, index) => SizedBox(
//               height: 8,
//             ),
//             scrollDirection: Axis.horizontal,
//             itemCount: forcastList.length,
//             itemBuilder: (context, index) => ClipRRect(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//               child: Container(
//                 width: MediaQuery.of(context).size.width / 2.3,
//                 height: 160,
//                 child: forcastCard(snapshot, index),
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(colors: [
//                   Color(0xff9661C3),
//                   Colors.white,
//                 ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
//               ),
//             ),
//           )),
//       Divider(),
//     ],
//   );
// }
