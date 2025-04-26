import 'package:flutter/material.dart';

import 'sun_progressbar_arcsize_removespace.dart';

class SunSection extends StatefulWidget {
  // var sunRise;
  //
  // String sunRiseHour;
  // String sunRiseMinute;

  SunSection( {super.key});

  @override
  State<SunSection> createState() => _SunSectionState();
}

class _SunSectionState extends State<SunSection> {
  @override
  Widget build(BuildContext context) {
    double dHeight = MediaQuery.of(context).size.width;
    // if(widget.sunRiseMinute==null){
    //   print("minute is null");
    //   widget.sunRiseMinute=30;
    // }
    return Column(children: [
      const Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
          Text('Sunrise and sunset',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
          Icon(Icons.arrow_forward_ios,color: Colors.white),
        ],),
      SizedBox(
        //color: Colors.transparent,
        width: 100, height:dHeight*0.2223,//0.223
        child:SunProgressbarArcsizeRemovespace() ,),//sunRiseHour:widget.sunRiseHour,sunRiseMinute: widget.sunRiseMinute,
    ],);
  }
}
