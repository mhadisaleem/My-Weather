
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
        required this.daysList});

  factory WeatherDaysModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> myDay = json["days"];
    List<Map<String, dynamic>> sevenDaysList = [];
    print("object");
    print("Days length" + myDay.length.toString());
    List<dynamic> myHours = [];
    for (int dayIndex = 0; dayIndex < 7; dayIndex++) {
      sevenDaysList.add(myDay[dayIndex]);
      ////// print(myDay[dayIndex]); // ok printing exect Seven days
      //print(sevenDaysList); // ok printing exect Seven days
      print("seven days length is " + sevenDaysList.length.toString());
      //log(sevenDaysList[dayIndex]["datetime"].toString());
      //print(sevenDaysList[dayIndex]["datetime"].toString());
      try {
        // DateTime sevenDays = DateTime.parse(sevenDaysList['datetime'].toString());
        // String sevenDay = DateFormat('EEEE,MMMd').format(sevenDays);
        // print(sevenDay);
        // seven days mai sy sirf 2 days liay, first current hour sy 23 hour tk
        // if hour list.length == 24, else go to day+1(also check both days date and data weather it is
        // same or not)

        // declare a list, then intialise in loop, then use this list in another list
        //will produce error
        // "The non-nullable local variable 'sevenDaysList' must be assigned before it can be used."
        // sevenDaysList
      } catch (e) {
        print(e);
        print("Error is");
      }
    }
    print("final list length is " + sevenDaysList.length.toString());
    for (int dayIndex = 0; dayIndex < 2; dayIndex++) {
      myHours
          .addAll(sevenDaysList[dayIndex]['hours']); //myDay[dayIndex]["hours"]
      //print( sevenDaysList['datetime']);
      ///// print(myHours);
      print("myHours length.. " + myHours.length.toString());
      //print(myDay[1]); ok working
      //print(myDay[dayIndex]["hours"]);ok giving today's hours and tomorrows hours list

      for (int hourIndex = 0; hourIndex < myHours.length; hourIndex++) {
        //print(myDay[dayIndex]);//
        // print("days index "+dayIndex.toString());  // ok days index 0 & days index 1 for 24 time each
        double strTemp = myHours[hourIndex]["temp"];
        String strTime = myHours[hourIndex]["datetime"];
        //print(strTemp);
        print("formated date is " + strTime);
      }
      //////           DateTime dateTime = DateFormat.Hms().parse(strTime); // log("Hms is "+dateTime.toString()); //Hms is 1970-01-01 21:00:00.000
      // String time12 = DateFormat.Hms().format(dateTime);
      ///////           DateTime now;
      ////////          if(hourIndex==24){
      ///////          now = DateTime.now().add(Duration(days: 1));}
      ///////           else{
      ///////             now = DateTime.now();
      ///////           }
      ////////           DateTime fullDateTime = DateTime(
      ///////             now.year,
      ///////             now.month,
      ///////             now.day,
      ///////             dateTime.hour,
      //////             dateTime.minute,
      //////             dateTime.second,
      //////           );
      //////           DateTime newDate = DateTime(
      //////             now.year,
      ////////             now.month,
      ///////             now.day,
      ////////             now.hour,
      ///////             now.minute,
      ///////             now.second,
      //////          );
      ///////  print("full date  is  "+fullDateTime.toString());
      //String newDate = DateFormat.jm().format(DateTime.now());
      //print("newDate  is  "+newDate);
      // DateTime dateTime1 = DateFormat.jm().parse(newDate);
      // DateTime dateTime2 = DateFormat.jm().parse(time12); //format.parse(newDate);// 10

      ///// if (fullDateTime==newDate) {
      // print("yes");
      // print(dateTime2);
      // log("New Date is " + newDate.toString());
      // log(time12.toString());
      ////// }
      //
      // DateTime sevenDays = DateTime.parse(myDay[0]['datetime']);
      // String sevenDay = DateFormat('EEEE,MMMd').format(sevenDays);
      // print("This is the 7 days date   $sevenDay");
    }
    // print("myHours length "+myHours.length.toString());
    // for(int hourIndex=0;hourIndex<myHours.length;hourIndex++){
    //   //print(myDay[dayIndex]);//
    //   // print("days index "+dayIndex.toString());  // ok days index 0 & days index 1 for 24 time each
    //   double strTemp = myHours[hourIndex]["temp"];
    //   String strTime = myHours[hourIndex]["datetime"];
    //   print(strTemp);
    //   print(strTime);
    // }
    String formattedTime = DateFormat("ha").format(DateTime.now()); //.jm()
    print("DateTime.now is " + formattedTime);
    int currentHourIndex = -1;
    for (int myHourIndex = 0; myHourIndex < myHours.length; myHourIndex++) {
      String myhour = myHours[myHourIndex]["datetime"];
      DateTime time = DateFormat("HH:mm:ss").parse(myhour); //Hms()
      String formatTime = DateFormat("ha").format(time); //"h:mma"
      print("datetime from list " + formatTime);
      if (formatTime == formattedTime) {
        print("hours from myhours " + myhour);
        currentHourIndex = myHourIndex;
        break;
      }
    }
    if (currentHourIndex != -1) {
      myHours = myHours.sublist(currentHourIndex); // Keep only elements from the current hour onward
      print("Filtered myHours: $myHours");
    }

    List<ListHour> hours;
    print("myHours length for fromjson" + myHours.length.toString());
    hours = myHours.map((hourJson) {
      print("sun Rise in weather days model "+ sevenDaysList[0]["sunrise"]);
      print("sun Set in weather days model"+ sevenDaysList[0]["sunset"]);
      print("weather icon is "+hourJson["icon"]);
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
        daysList: sevenDay //[]
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
