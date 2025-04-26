import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../constants/padding.dart';
import '../controllers/weather_controller.dart';
import '../data/forecast_data.dart';
import 'widgets/degree_widget.dart';
import 'widgets/humidity_section.dart';
import 'widgets/sun_section.dart';
import 'widgets/wind_section.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String cityName = "Faisalabad";
  late String temp = "34";
  late String status = "Partly cloude";
  late String maxTemp = "39";
  late String minTemp = "28";
  late String lastUpdate = "Updated at 2.00pm";
  String developerName = "M Farhan Saleem";
  // getWeatherData(String query) async {
  //   var url = Uri.parse(
  //       "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/faisalabad?unitGroup=metric&include=days%2Chours%2Calerts%2Ccurrent&key=YJSBHLD6KPJQAT4ULZWZGHJQB&contentType=json");
  //   Response response = await get(url);
  //   var data = jsonDecode(response.body);
  //   List<dynamic> myDay = data["days"];
  //   log("Total days  " + myDay.length.toString());
  //
  //   //for(int dayIndex=0;dayIndex<myDay.length;dayIndex++) {
  //
  //   print("Average Temprature is  "+myDay[0]['temp'].toString());
  //   print("Condition is  "+myDay[0]["conditions"].toString());
  //   print("Average Temprature Max is  "+myDay[0]['tempmax'].toString());
  //   print("Average Temprature is  "+myDay[0]['temp'].toString());
  //   print("Average Temprature is  "+myDay[0]['temp'].toString());
  //
  //   List<dynamic> hours = myDay[0]["hours"];
  //   // log("Day " + dayIndex.toString());
  //   for (int hourIndex = 0; hourIndex < hours.length; hourIndex++) {
  //     String strTime = hours[hourIndex]['datetime'];
  //     DateTime dateTime = DateFormat.Hms().parse(strTime);
  //     // log("Hms is "+dateTime.toString()); //Hms is 1970-01-01 21:00:00.000
  //     String time12 = DateFormat.jm().format(dateTime);
  //     print("time12 is  "+time12);
  //     String newDate = DateFormat.jm().format(DateTime.now());
  //     print("newDate  is  "+newDate);
  //    // String weekDay = DateFormat('E,MMMd').format(DateTime.now());
  //    // try{
  //       DateTime sevenDays = DateTime.parse(myDay[0]['datetime']);
  //     String sevenDay = DateFormat('EEEE,MMMd').format(sevenDays);
  //    // }
  //     //catch(e){
  //       print("This is the 7 days date   $sevenDay");
  //     //   print(e);
  //     // }
  //
  //
  //
  //     // DateFormat format = DateFormat.jm(); // Format for "8:00 AM" type strings
  //
  //     DateTime dateTime1 = DateFormat.jm().parse(newDate);
  //     DateTime dateTime2 =
  //         DateFormat.jm().parse(time12); //format.parse(newDate);// 10
  //     // print("yes");
  //     // print("yes");
  //     if (dateTime1.hour == dateTime2.hour) {
  //       print("yes");
  //       log("New Date is " + newDate.toString());
  //       log(time12.toString());
  //     }
  // if(time12==newDate){
  //}
  // print(time12);

  //log(hours.length.toString());
  //}
  //}

  // for(int i=0;i<=myDay.length;i++){
  // List<dynamic> hours = myDay[i]["hours"];
  // log("Start of Days and Hour".toString());
  // log(myDay[i].toString());
  // log("      ".toString());
  // log("      ".toString());
  // log(hours.toString());
  // log("End of Index".toString());
  // log("      ".toString());
  // log("      ".toString());
  // DateTime dateTimeWithTimeZone = DateTime.parse("00");
  //   print(DateFormat('H').format(dateTimeWithTimeZone));

  //print(new DateFormat.jm().format(DateTime.parse("00:00:00")));
  //}
  // DateTime dateTime = DateFormat.Hms().parse(strTime);
  // String time12 = DateFormat.jm().format(dateTime);
  // print(time12);                                         // Map finalHour =  hours[5];
  // log(finalHour.toString());
  // }
  WeatherController weatherController = Get.put(WeatherController());
  final data = ForecastData();
  // List<ForecastModel> data = ForecastData().forecastDataList;
  //  late ForecastData forecastData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weatherController.loadWeatherData();
    // getWeatherData("Faisalabad");
  }

  @override
  Widget build(BuildContext context) {
    // String sunRise = weatherController.weatherDaysModel.value.sunRise;
    // String sunSet = weatherController.weatherDaysModel.value.sunSet;
    // List<String> sunRiseList = sunRise.split(':');
    // int sunRiseHour = int.parse(sunRiseList[0]);
    // int sunRiseMinute = int.parse(sunRiseList[1]);
    // print(sunRiseList.length.toString());
    // print("Hours for sun is "+int.parse(sunRiseList[0]).toString());
    // print("minute for sun is "+sunRiseMinute.toString());
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    return Stack(
      children: [
        Image.asset(
          'assets/background/open_weather.png',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: const Icon(
              Icons.location_city,
              color: Colors.white,
            ),
            title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                cityName,
                style: const TextStyle(color: Colors.white),
              ),
              const Icon(
                Icons.location_on_outlined,
                color: Colors.white,
              )
            ]),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              )
            ],
          ),
          backgroundColor: Colors.black26,
          body: Padding(
            padding: konlyPaddingLR,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Column(
                    children: [
                      // Text("data,\u00B0",style: TextStyle(fontSize: 20)),
                      // Text("data"),Text("data"),

                      Obx(() => DegreeWidget(
                          temp: weatherController.weatherDaysModel.value.aveTemp.toInt()
                              .toString(), //temp,
                          tFontSize: 90,
                          dFontSize: 35,
                          offSetVal: -35)),
                      Obx(
                            () => Text(
                          weatherController.weatherDaysModel.value.condition,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                      //\u00b0
                      Obx(
                            () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DegreeWidget(
                                temp: weatherController
                                    .weatherDaysModel.value.maxTemp
                                    .toInt().toString(),
                                tFontSize: 15,
                                dFontSize: 10,
                                offSetVal: -8),
                            const Text(
                              " / ",
                              style: TextStyle(color: Colors.white),
                            ),
                            DegreeWidget(
                                temp: weatherController
                                    .weatherDaysModel.value.minTemp.toInt()
                                    .toString(),
                                tFontSize: 15,
                                dFontSize: 10,
                                offSetVal: -8),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(lastUpdate,
                          style: const TextStyle(
                              fontSize: 10, color: Colors.white)),
                      Text(developerName,
                          style: const TextStyle(
                              fontSize: 10, color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 3),
                  const Divider(
                    height: 0.1,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height < 600
                          ? MediaQuery.of(context).size.height * .34
                          : MediaQuery.of(context).size.height *
                          .18, //MediaQuery.of(context).size.height*.18,
                      width: MediaQuery.of(context).size.width,
                      child: Obx(
                            () => ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            //physics: NeverScrollableScrollPhysics(),
                            itemCount:
                            weatherController
                                .weatherDaysModel
                                .value
                                .hourList
                                .length, //data.forecastDataList.length,
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 40);
                            },
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Obx(() => Text(
                                      hourDateTimeFormat(weatherController
                                          .weatherDaysModel
                                          .value
                                          .hourList[index]
                                          .hourTime) ////data.forecastDataList[index].dateTime.toString()
                                  )),

                                  const SizedBox(
                                    height: 10,
                                  ),
                                  //Text(weatherController.weatherDaysModel.value.hourList[index].icons.toString()),
                                  getWeatherIcon(weatherController
                                      .weatherDaysModel
                                      .value
                                      .hourList[index]
                                      .icons.toString()),
                                  //Icon(Icons.add),
                                  //data.forecastDataList[index].icon,
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  DegreeWidget(
                                      temp: weatherController.weatherDaysModel
                                          .value.hourList[index].hourTemp.toInt()
                                          .toString(),
                                      tFontSize: 15,
                                      dFontSize: 10,
                                      offSetVal:
                                      -8), // Text(data.forecastDataList[index].tempData
                                  //     .toString()),
                                  const SizedBox(height: 10)
                                ],
                              );
                              //);
                            }),
                      )),
                  Kdivider,
                  SizedBox(
                    height: MediaQuery.of(context).size.height < 600
                        ? MediaQuery.of(context).size.height * .85
                        : MediaQuery.of(context).size.height * .44,
                    width: MediaQuery.of(context).size.width,
                    child: Obx(
                          () => ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: weatherController
                              .weatherDaysModel
                              .value
                              .daysList
                              .length, //7,//data.forecastDataList.length,
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 0);
                          },
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.only(top: 7, bottom: 7),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox( width:76,
                                        child: Text(daysDateTImeFormat(weatherController
                                            .weatherDaysModel
                                            .value
                                            .daysList[index]
                                            .dateTime) //
                                        ),
                                      ), //data.forecastDataList[index].dateTime.toString()
                                      Align(alignment: Alignment.centerLeft,
                                        child: getWeatherIcon(weatherController
                                            .weatherDaysModel
                                            .value
                                            .daysList[index]
                                            .icons),
                                      ),// Align(alignment:Alignment.center,child: data.forecastDataList[index].icon),

                                      Obx(
                                            () => Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            DegreeWidget(
                                                temp: weatherController
                                                    .weatherDaysModel.value.daysList[index].maxTemp.toInt()
                                                    .toString(),
                                                tFontSize: 15,
                                                dFontSize: 10,
                                                offSetVal: -8),
                                            const Text(
                                              " / ",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            DegreeWidget(
                                                temp: weatherController
                                                    .weatherDaysModel.value.daysList[index].minTemp.toInt()
                                                    .toString(),
                                                tFontSize: 15,
                                                dFontSize: 10,
                                                offSetVal: -8),// Text(data.forecastDataList[index].tempData
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Kdivider,
                              ],
                            );
                            //);
                          }),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(()=>HumiditySection(
                    humidity: weatherController.weatherDaysModel.value
                        .humidity,feelsLike:  weatherController.weatherDaysModel.value
                      .feelsLike,uvIndex: weatherController.weatherDaysModel.value
                      .uvIndex,)), //Container(width:200,height:150,child: Progressbar(),),
                  Kdivider,
                  const SizedBox(height: 10),
                  Obx(()=>WindSection(airSpeed: weatherController.weatherDaysModel.value.windSp,airDirection:  weatherController.weatherDaysModel.value
                      .windDir)), //Container(width: 200,height: 150,child: WindSection(),),
                  Kdivider,
                  // Container(width: 200,height: 150,
                  //     color: Colors.transparent,
                  // child:SunProgressBarRays()),
                  const SizedBox(height: 10),
                  SunSection(),//sunRiseHour: 7,sunRiseMinute: 30,
                  Kdivider,
                  const Padding(
                    padding: EdgeInsets.only(left:20.0,right:20),
                    child:   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('06:20AM'),Text('06:15PM')],),//('07:08AM'),Text('05:21PM')
                  ),

                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Map<String, IconData> weatherIcons={
    "clear-day": Icons.wb_sunny,
    "clear-night": Icons.nightlight_round,//,
    "rain": Icons.grain,
    "snow": Icons.ac_unit,
    "sleet": Icons.grain,
    "wind": Icons.air,
    "fog": Icons.cloud,
    "cloudy": Icons.cloud,
    "partly-cloudy-day": Icons.wb_cloudy,
    "partly-cloudy-night": Icons.nights_stay,
  };
  Map<String, Color> weatherIconColors = {
    "clear-day": Colors.yellow.shade800,
    "clear-night": Colors.white,//blueGrey,
    "rain": Colors.blue,
    "snow": Colors.white,
    "sleet": Colors.lightBlueAccent,
    "wind": Colors.teal,
    "fog": Colors.grey,
    "cloudy": Colors.white,
    "partly-cloudy-day": Colors.white,
    "partly-cloudy-night": Colors.black,//Colors.indigo,
  };
  Icon getWeatherIcon(String iconString) {
    print("Weather icon string is "+iconString);
    return Icon(
      weatherIcons[iconString] ?? Icons.error, // Default to an error icon if no match
      size: 25.0,
      color: weatherIconColors[iconString] ?? Colors.red,

    );
  }
  String hourDateTimeFormat(String hourTime) {
    DateTime time = DateFormat("HH:mm:ss").parse(hourTime);
    String formattedTime = DateFormat("h:mma").format(time);
    return formattedTime;
  }

  String daysDateTImeFormat(String dateTime) {
    print("sun inn home "+"${weatherController.weatherDaysModel.value.sunRise}");
    DateTime sevenDays = DateTime.parse(dateTime);
    String sevenDay = DateFormat('EEE,MMMd').format(sevenDays);
    return sevenDay;
  }
}

//List Hour = Day["hours"];
//List hour = data["hours"];
//Map mhour = myDay["hours"];
//List<dynamic> mhour = data['hours'];
//List<dynamic> mhour = data["days"]['hours'];
//log(myDay[37]['hours'][0].toString());

// for (var day in data) {
//   print('Date: ${day['datetime']}');
//   List<dynamic> hours = day['hours'];
//   for (var hour in hours) {
//     print('  Time: ${hour['datetime']}, Temperature: ${hour['temp']}');
//   }
//
