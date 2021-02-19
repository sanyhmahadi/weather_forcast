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
              //ekhane separate hobe totat amount of index and index = 7 casue List ar index holo 7 ta
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.list.length,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.3,
                  height: 160,
                  child: forcastCard(snapshot,
                      index), //ekhane forcast_card thake snapshot and index-
                  //index(data base ar List ar index which is 7 ) ata pass hocchey
                  //and ei kahner index ta itemBuiler er index a pass hobe
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color(0xff9661C3),
                    Color(0xfffd79a8),
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
