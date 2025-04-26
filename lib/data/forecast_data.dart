import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/forecast_model.dart';
class ForecastData {
//var date = DateTime.now();

// DateTime nowD = DateTime.now();
//DateTime newDateTime = nowD.add(Duration( hours: 1));
//print(newDateTime);
  //List<ForecastModel> forecastDataList = <ForecastModel>[
  final forecastDataList =  <ForecastModel>[
    ForecastModel(dateTime: DateFormat.jm().format(DateTime.now()),icon:Icon(Icons.cloud,color: Colors.white,),tempData: 23),
    ForecastModel(dateTime: DateFormat.jm().format(DateTime.now()),icon:Icon(Icons.cloud,color: Colors.white),tempData: 23),
    ForecastModel(dateTime: DateFormat.jm().format(DateTime.now()),icon:Icon(Icons.cloud,color: Colors.white),tempData: 23),
    ForecastModel(dateTime: DateFormat.jm().format(DateTime.now()),icon:Icon(Icons.cloud,color: Colors.white),tempData: 23),
    ForecastModel(dateTime: DateFormat.jm().format(DateTime.now()),icon:Icon(Icons.cloud,color: Colors.white),tempData: 23),
    ForecastModel(dateTime: DateFormat.jm().format(DateTime.now()),icon:Icon(Icons.cloud),tempData: 23),
    ForecastModel(dateTime: DateFormat.jm().format(DateTime.now()),icon:Icon(Icons.cloud,color: Colors.white),tempData: 23),
    ForecastModel(dateTime: DateFormat.jm().format(DateTime.now()),icon:Icon(Icons.cloud),tempData: 23),
    ForecastModel(dateTime: DateFormat.jm().format(DateTime.now()),icon:Icon(Icons.cloud,color: Colors.white),tempData: 23),
    ForecastModel(dateTime: DateFormat.jm().format(DateTime.now()),icon:Icon(Icons.cloud),tempData: 23),
    ForecastModel(dateTime: DateFormat.jm().format(DateTime.now()),icon:Icon(Icons.cloud),tempData: 23),
    ForecastModel(dateTime: DateFormat.jm().format(DateTime.now()),icon:Icon(Icons.cloud,color: Colors.white),tempData: 23),
    ForecastModel(dateTime: DateFormat.jm().format(DateTime.now()),icon:Icon(Icons.cloud),tempData: 23),
    ForecastModel(dateTime: DateFormat.jm().format(DateTime.now()),icon:Icon(Icons.cloud,color: Colors.white),tempData: 23),
    ForecastModel(dateTime: DateFormat.jm().format(DateTime.now()),icon:Icon(Icons.cloud),tempData: 23),
    ForecastModel(dateTime: DateFormat.jm().format(DateTime.now()),icon:Icon(Icons.cloud),tempData: 23),
    ForecastModel(dateTime: DateFormat.jm().format(DateTime.now()),icon:Icon(Icons.cloud,color: Colors.white),tempData: 23),
    ForecastModel(dateTime: DateFormat.jm().format(DateTime.now()),icon:Icon(Icons.cloud),tempData: 23),

  ];
}