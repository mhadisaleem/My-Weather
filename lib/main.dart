import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:weather_forecast/model/weather_days_model.dart';
import 'screens/home.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(WeatherDaysModelAdapter());
  Hive.registerAdapter(ListHourAdapter());
  Hive.registerAdapter(ListDayAdapter());
  await Hive.openBox<WeatherDaysModel>('WeatherBox'); // Initialize services before the app starts
  runApp(
      SafeArea(
        child:  GetMaterialApp(home: Home(),
          debugShowCheckedModeBanner: false,),
      ));
}


