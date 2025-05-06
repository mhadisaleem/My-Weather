
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'weather_days_model.g.dart';
@HiveType(typeId: 0)

class WeatherDaysModel extends HiveObject{

  @HiveField(0)
  late final double aveTemp;//aveDaysTemp
  @HiveField(1)
  late final String condition;
  @HiveField(2)
  late final double minTemp; //aveMinDaysTemp
  @HiveField(3)
  late final double maxTemp; //aveMaxDaysTemp
  @HiveField(4)
  late final String dayTime;
  @HiveField(5)
  late final String icons;
  @HiveField(6)
  late final double humidity;
  @HiveField(7)
  late final double feelsLike;
  @HiveField(8)
  late final double uvIndex;
  @HiveField(9)
  late final double windDir;
  @HiveField(10)
  late final double windSp;
  @HiveField(11)
  late final String sunRise;
  @HiveField(12)
  late final String sunSet;
  @HiveField(13)
  late final List<ListHour> hourList;
  @HiveField(14)
  late final List<ListDay> daysList;
  @HiveField(15)
  late final String cityName;

  WeatherDaysModel(
      {required this.aveTemp,
        required this.condition,
        required this.minTemp,
        required this.maxTemp,
        required this.dayTime,
        required this.icons,
        required this.humidity,
        required this.feelsLike,
        required this.uvIndex,
        required this.windDir,
        required this.windSp,
        required this.sunRise,
        required this.sunSet,
        required this.hourList,
        required this.daysList,
        required this.cityName});

  factory WeatherDaysModel.fromJson(Map<String, dynamic> json, String cName) {
    List<dynamic> myDay = json["days"];
    List<Map<String, dynamic>> sevenDaysList = [];
    // print("object");//cIcd
    // print("Days length" + myDay.length.toString());//cIcd
    List<dynamic> myHours = [];
    for (int dayIndex = 0; dayIndex < 7; dayIndex++) {
      sevenDaysList.add(myDay[dayIndex]);
      //print("seven days length is " + sevenDaysList.length.toString());//cIcd
    }
    //print("final list length is " + sevenDaysList.length.toString());//cIcd
    for (int dayIndex = 0; dayIndex < 2; dayIndex++) {
      myHours
          .addAll(sevenDaysList[dayIndex]['hours']); //myDay[dayIndex]["hours"]
      //print("myHours length.. " + myHours.length.toString());//cIcd
      //print(myDay[1]); ok working
      //print(myDay[dayIndex]["hours"]);ok giving today's hours and tomorrows hours list

      for (int hourIndex = 0; hourIndex < myHours.length; hourIndex++) {
        //print(myDay[dayIndex]);//
        // print("days index "+dayIndex.toString());  // ok days index 0 & days index 1 for 24 time each
        //double strTemp = myHours[hourIndex]["temp"];//cIcd value is not being used
        //String strTime = myHours[hourIndex]["datetime"];//cIcd
        //print(strTemp);
       // print("formated date is " + strTime);//cIcd
      }
    }
    String formattedTime = DateFormat("ha").format(DateTime.now()); //.jm()
    //print("DateTime.now is " + formattedTime);//cIcd
    int currentHourIndex = -1;
    for (int myHourIndex = 0; myHourIndex < myHours.length; myHourIndex++) {
      String myHour = myHours[myHourIndex]["datetime"];
      DateTime time = DateFormat("HH:mm:ss").parse(myHour); //Hms()
      String formatTime = DateFormat("ha").format(time); //"h:mma"
      //print("datetime from list " + formatTime);//cIcd
      if (formatTime == formattedTime) {
        //print("hours from myhours " + myHour);//cIcd
        currentHourIndex = myHourIndex;
        break;
      }
    }
    if (currentHourIndex != -1) {
      myHours = myHours.sublist(currentHourIndex); // Keep only elements from the current hour onward
      //print("Filtered myHours: $myHours");//cIcd
    }

    List<ListHour> hours;
   // print("myHours length for fromjson" + myHours.length.toString());//cIcd
    hours = myHours.map((hourJson) {
      // print("sun Rise in weather days model "+ sevenDaysList[0]["sunrise"]);//cIcd
      // print("sun Set in weather days model"+ sevenDaysList[0]["sunset"]);//cIcd
      // print("weather icon is "+hourJson["icon"]);//cIcd
      // print(hourJson['datetime']);
      return ListHour.fromJson(hourJson);
    }).toList();
    List<ListDay> sevenDay;
    sevenDay = sevenDaysList.map((day) {
      return ListDay.fromJson(day);
    }).toList();
    //////print(hours[0].hourTime);
    return WeatherDaysModel(
        aveTemp: sevenDaysList[0]["temp"].toInt().toDouble(), //0,
        condition: sevenDaysList[0]["conditions"].toString(),
        minTemp: sevenDaysList[0]["tempmin"].toInt().toDouble(), //0,
        maxTemp: sevenDaysList[0]["tempmax"].toInt().toDouble(), //0,
        dayTime: sevenDaysList[0]["datetime"], //'0',
        icons: "clear_day",//Icon(Icons.add),
        humidity: sevenDaysList[0]["humidity"].toInt().toDouble(), //0,
        feelsLike: sevenDaysList[0]["feelslike"].toInt().toDouble(), //0,
        uvIndex: sevenDaysList[0]["uvindex"], //0,
        windDir: sevenDaysList[0]["winddir"].toInt().toDouble(), //0,
        windSp: sevenDaysList[0]["windspeed"].toInt().toDouble(), //0,
        sunRise: sevenDaysList[0]['sunrise'], //'0',
        sunSet: sevenDaysList[0]["sunset"], //'0',
        hourList: hours,
        daysList: sevenDay, //[]
        cityName: cName,
    );
  }
}


@HiveType(typeId: 1)
class ListHour extends HiveObject{
  @HiveField(0)
  late final String hourTime;
  @HiveField(1)
  late final String icons;
  @HiveField(2)
  late final double hourTemp;

  ListHour(
      {required this.hourTime, required this.icons, required this.hourTemp});

  factory ListHour.fromJson(Map<String, dynamic> json) {
    return ListHour(
        hourTime: json["datetime"],
        icons: json["icon"],//Icon(Icons.ac_unit),
        hourTemp: json["temp"].toInt().toDouble());
    //print(json["icon"]);
  }
}

@HiveType(typeId: 2)
class ListDay extends HiveObject{

  @HiveField(0)
  late final String dateTime;
  @HiveField(1)
  late final String icons;
  @HiveField(2)
  late final double maxTemp;
  @HiveField(3)
  late final double minTemp;

  ListDay(
      {required this.dateTime,
        required this.icons,
        required this.maxTemp,
        required this.minTemp});

  factory ListDay.fromJson(Map<String, dynamic> json) {
    return ListDay(
        dateTime: json["datetime"],
        icons: json["icon"],//Icon(Icons.ac_unit),
        maxTemp: json["tempmax"].toInt().toDouble(), //0.00,
        minTemp: json["tempmin"].toInt().toDouble());
  }
}

//now the real problem is, i have two days in outer loop, and in every day i we have 24 hours,
// these hours i am iterating in second loop and adding it in the list,
// data i am getting from api is string, for hours like  "00:00:00" "01:00:00" to "23:00:00"
// which i am converting in "12:00am" format  and then convert it to Date format,
// at the completion of both iteration of outer loop, we must have list of 48 hours (24 in each day),
// and from this list i want to choose the current hour, but here it shows me some logical error,
// suppose my current hour is 10:00am now it gives me 2 or 4 hours from list,
// but i want only 1 exact hour matching the current hour?
