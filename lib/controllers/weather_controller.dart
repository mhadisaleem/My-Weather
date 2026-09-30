import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import '../helper/location_helper.dart';
import '../model/weather_days_model.dart';

class WeatherController extends GetxController

{
  var fLocation = "".obs;
  var weatherDaysModel = WeatherDaysModel(
      aveTemp: 0,
      condition: 'Not Accessed',
      minTemp: 0,
      maxTemp: 0,
      dayTime: '0',
      icons: 'clear_day',//Icon(Icons.IceCream_outlined),
      feelsLike: 0.0,
      hourList: [],
      humidity: 0,
      sunRise: '0',
      sunSet:  '0',
      uvIndex: 0,
      windDir: 0,
      windSp: 0,
      daysList: [],
      cityName: ""
  ).obs;
  var box = Hive.box<WeatherDaysModel>('WeatherBox');
  final String apiKey = dotenv.env['API_KEY']!;
  void saveWeatherData(WeatherDaysModel weatherData) async {
    box.clear();
    try{await box.put('weatherData', weatherData);
    }
    catch(e){
      // print("Error in put hive");//cicd
      // print(e);
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getWeatherByLocation();

  }
  void loadWeatherData() {
   // var box = Hive.box('weatherBox');
    try{
    var savedData = box.get('weatherData');
    if (savedData != null) {
      weatherDaysModel.value = savedData;
    }}
        catch(e){
      // print(e);//cicd
      // print("Hive exception");
        }

  }
  Future<void> getWeatherByLocation() async {

    final location = await LocationService().getCurrentLocation();
    var lat = location.latitude;
    var lon = location.longitude;
     //fLocation=getCityFromCoordinates(lat,lon);
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    if(placemarks.isNotEmpty){
      //print("Location is "+placemarks[0].locality.toString());//cicd
      fLocation.value=placemarks[0].locality??"Multan";
      //weatherDaysModel.value.cityName =fLocation.value;
      //print("Location is "+fLocation.toString());
      fetchData(fLocation.value);

    }

  }



  void fetchData(var location) async{
   // print("Location is"+location);

    var url = Uri.parse(
        "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$location?unitGroup=metric&include=days%2Chours%2Calerts%2Ccurrent&key=$apiKey&contentType=json");
    var response = await get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      //print(data);
      weatherDaysModel.value = WeatherDaysModel.fromJson(data,fLocation.value);
      saveWeatherData(weatherDaysModel.value);
    } else {
      throw Exception('Failed to load weather data');
    }

  }

}