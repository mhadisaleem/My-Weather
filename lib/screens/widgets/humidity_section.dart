import 'package:flutter/material.dart';

import 'progressbar.dart';


class HumiditySection extends StatelessWidget {
  final double humidity;
  final double feelsLike;
  final double uvIndex;


  const HumiditySection(  {super.key,required this.humidity,required this.feelsLike,required this.uvIndex});//
  //final double  humidity;

  @override
  Widget build(BuildContext context) {
    return  Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const  Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Text('Comfort level',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
            Icon(Icons.arrow_forward_ios,color: Colors.white,),
          ],),
        const SizedBox(height: 25),
        const Padding(
          padding: EdgeInsets.only(left:25.0),
          child: Text('Humidity',style: TextStyle(color: Colors.white)),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 100,height: 100,
                child: Progressbar(humidity:humidity)),
            Padding(
              padding: EdgeInsets.only(right:110.0),
              child: Column(crossAxisAlignment:CrossAxisAlignment.start, children: [
                Text("Feels like $feelsLike"),
                const SizedBox(height:10),
                Text("UV index $uvIndex")
              ],),
            )
          ],)
      ],
    );
  }
}

//
// Column(children: [
// Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
// Text('Confort level',style: TextStyle(fontSize: 20,color: Colors.black),),
// Icon(Icons.arrow_right,),
// ],),
// Column(children: [
// Text('Humidity'),
// Container(width: 150,height: 150,child: Progressbar(),)
// ],)
// ],);