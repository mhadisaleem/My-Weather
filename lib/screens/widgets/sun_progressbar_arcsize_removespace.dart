import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/weather_controller.dart';

class SunProgressbarArcsizeRemovespace extends StatefulWidget {
  const SunProgressbarArcsizeRemovespace({super.key});

  @override
  SunProgressbarArcsizeRemovespaceState createState() =>
      SunProgressbarArcsizeRemovespaceState();
}

class SunProgressbarArcsizeRemovespaceState
    extends State<SunProgressbarArcsizeRemovespace> {
  final WeatherController weatherController = Get.find();
  late Timer _timer;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _updateProgress();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _updateProgress();
    });
  }

  void _updateProgress() {
    // Default sunrise and sunset values if data is not yet available
    TimeOfDay sunrise = TimeOfDay(hour: 1, minute: 1);
    TimeOfDay sunset = TimeOfDay(hour: 17, minute: 19);

    try {
      // Parse sunRise and sunSet from controller
      if (weatherController.weatherDaysModel.value.sunRise.isNotEmpty &&
          weatherController.weatherDaysModel.value.sunSet.isNotEmpty) {
        List<String> sunRiseList =
        weatherController.weatherDaysModel.value.sunRise.split(':');
        // print(" minute of sunRise" +int.parse(sunRiseList[1]).toString());//cIcd
        // print(" Hour of sunRise" +int.parse(sunRiseList[0]).toString());//cIcd
        List<String> sunSetList =
        weatherController.weatherDaysModel.value.sunSet.split(':');

        sunrise = TimeOfDay(
          hour: int.parse(sunRiseList[0]),
          minute: int.parse(sunRiseList[1]),
        );

        sunset = TimeOfDay(
          hour: int.parse(sunSetList[0]),
          minute: int.parse(sunSetList[1]),
        );
      }
    } catch (e) {
      //print("Error parsing sunrise or sunset: $e");//cIcd
    }

    // Calculate total minutes from sunrise to sunset
    double totalMinutes =
    ((sunset.hour - sunrise.hour) * 60 + (sunset.minute - sunrise.minute))
        .toDouble();

    // Get current time
    TimeOfDay now = TimeOfDay.now();

    // Calculate current minutes from sunrise
    double currentMinutes =
    ((now.hour - sunrise.hour) * 60 + (now.minute - sunrise.minute))
        .toDouble();

    // Ensure current minutes are within the range
    if (currentMinutes < 0) currentMinutes = 0;
    if (currentMinutes > totalMinutes) currentMinutes = totalMinutes;

    // Calculate progress as a percentage
    _progress = currentMinutes / totalMinutes;

    setState(() {});
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double arcRadius = MediaQuery.of(context).size.width * 0.4;

    return Scaffold(
      backgroundColor: Colors.transparent,
      // appBar: AppBar(
      //   title: Text('Sunrise and Sunset'),
      // ),
      body: Obx(() {
        // Check if sunRise and sunSet are available
        if (weatherController.weatherDaysModel.value.sunRise.isEmpty ||
            weatherController.weatherDaysModel.value.sunSet.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        return Center(
          child: Container(
            width: arcRadius * 2,
            height:arcRadius,//arcRadius,
            color: Colors.transparent,
            child: CustomPaint(
              painter: _ArcPainter(_progress, arcRadius),
            ),
          ),
        );
      }),
    );
  }
}

class _ArcPainter extends CustomPainter {
  final double progress;
  final double arcRadius;

  _ArcPainter(this.progress, this.arcRadius);

  @override
  void paint(Canvas canvas, Size size) {
    // Track Paint: For the dashed arc
    Paint trackPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Arc Paint: For the moving progress arc
    // Paint arcPaint = Paint()
    //   ..color = Colors.yellow
    //   ..strokeWidth = 2
    //   ..style = PaintingStyle.stroke
    //   ..strokeCap = StrokeCap.round;

    // Sun Paint: For the moving sun
    Paint sunPaint = Paint()
      ..color = Colors.yellowAccent
      ..style = PaintingStyle.fill;

    // Ray Paint: For the sun rays
    Paint rayPaint = Paint()
      ..color = Colors.yellowAccent
      ..strokeWidth = 2;

    // Draw dashed arc
    double dashWidth = 5;
    double dashSpace = 5;
    double startAngle = 7 * pi / 6; // Adjusted start angle
    double sweepAngle = 2 * pi / 3; // Adjusted sweep angle
    double currentAngle = startAngle;

    while (currentAngle < startAngle + sweepAngle) {
      final double endAngle = currentAngle + dashWidth / arcRadius;
      final double dashAngle =
          min(endAngle, startAngle + sweepAngle) - currentAngle;
      canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, arcRadius), radius: arcRadius),
        currentAngle,
        dashAngle,
        false,
        trackPaint,
      );
      currentAngle += dashAngle + dashSpace / arcRadius;
    }

    // Draw the moving sun
    double sunAngle = startAngle + sweepAngle * progress;
    double sunX = size.width / 2 + arcRadius * cos(sunAngle);
    double sunY = arcRadius + arcRadius * sin(sunAngle);

    canvas.drawCircle(Offset(sunX, sunY), arcRadius * 0.05, sunPaint);

    // Draw sun rays
    for (int i = 0; i < 12; i++) {
      double rayAngle = 2 * pi * i / 12; // 12 rays equally spaced
      double startX =
          sunX + arcRadius * 0.075 * cos(rayAngle); // Start closer to sun
      double startY = sunY + arcRadius * 0.075 * sin(rayAngle);
      double endX =
          sunX + arcRadius * 0.125 * cos(rayAngle); // Extend further out
      double endY = sunY + arcRadius * 0.125 * sin(rayAngle);
      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), rayPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
