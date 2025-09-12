import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../constants/padding.dart';
import '../controllers/weather_controller.dart';
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
  WeatherController weatherController = Get.put(WeatherController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weatherController.loadWeatherData();
    // getWeatherData("Faisalabad");
  }

  @override
  Widget build(BuildContext context) {

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
    Obx(() =>Text(
                weatherController.fLocation.value,
                style: const TextStyle(color: Colors.white),
              ),),
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
            padding: kOnlyPaddingLR,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Column(
                    children: [
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
                  SizedBox(
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
                  kDivider,
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
                                kDivider,
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
                  kDivider,
                  const SizedBox(height: 10),
                  Obx(()=>WindSection(airSpeed: weatherController.weatherDaysModel.value.windSp,airDirection:  weatherController.weatherDaysModel.value
                      .windDir)), //Container(width: 200,height: 150,child: WindSection(),),
                  kDivider,
                  // Container(width: 200,height: 150,
                  //     color: Colors.transparent,
                  // child:SunProgressBarRays()),
                  const SizedBox(height: 10),
                  SunSection(),//sunRiseHour: 7,sunRiseMinute: 30,
                  kDivider,
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
    //print("Weather icon string is "+iconString);//cicd
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
   // print("sun inn home "+"${weatherController.weatherDaysModel.value.sunRise}");//cicd
    DateTime sevenDays = DateTime.parse(dateTime);
    String sevenDay = DateFormat('EEE,MMMd').format(sevenDays);
    return sevenDay;
  }
}
