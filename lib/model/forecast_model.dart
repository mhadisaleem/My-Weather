import 'package:flutter/material.dart';

class ForecastModel{

  late String dateTime;
  late Icon icon;
  late double tempData;


  ForecastModel({required this.dateTime,required this.icon,required this.tempData});
}