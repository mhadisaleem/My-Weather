import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';

import '../model/weather_days_model.dart';

class WeatherController extends GetxController

{
  var weatherDaysModel = WeatherDaysModel(
      aveTemp: 0,
      condition: 'Not Accessed',
      minTemp: 0,
      maxTemp: 0,
      dayTime: '0',
      icons: 'clear_day',//Icon(Icons.icecream_outlined),
      feelsLike: 0.0,
      hourList: [],
      humidity: 0,
      sunRise: '0',
      sunSet:  '0',
      uvIndex: 0,
      windDir: 0,
      windSp: 0,
      daysList: []
  ).obs;
  var box = Hive.box<WeatherDaysModel>('WeatherBox');
  void saveWeatherData(WeatherDaysModel weatherData) async {
    box.clear();
    try{await box.put('weatherData', weatherData);
    }
    catch(e){
      print("Error in put hive");
      print(e);
    }

  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }
  void loadWeatherData() {
   // var box = Hive.box('weatherBox');
    try{
    var savedData = box.get('weatherData');
    if (savedData != null) {
      weatherDaysModel.value = savedData;
    }}
        catch(e){
      print(e);
      print("Hive exception");
        }

  }

  void fetchData() async{

    var url = Uri.parse(
        "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/faisalabad?unitGroup=metric&include=days%2Chours%2Calerts%2Ccurrent&key=YJSBHLD6KPJQAT4ULZWZGHJQB&contentType=json");
    var response = await get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      weatherDaysModel.value = WeatherDaysModel.fromJson(data);
      saveWeatherData(weatherDaysModel.value);
    } else {
      //var weatherBox = Hive.box("WeatherBox");
      // weatherDaysModel.value =box.get('weatherData')!;
      // print("Hive value is "+ box.get('weatherData').toString());
      throw Exception('Failed to load weather data');
    }

  }

}