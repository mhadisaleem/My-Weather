import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:weather_forecast/controllers/weather_controller.dart';

class Progressbar extends StatefulWidget {
  const Progressbar({super.key,required this.humidity});//
  final double humidity;

  @override
  State<Progressbar> createState() => _ProgressbarState();
}

class _ProgressbarState extends State<Progressbar> {
  WeatherController weatherController= Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.transparent,
      body: Obx(()=>SfRadialGauge(axes: <RadialAxis>[
        RadialAxis(
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: false,
          pointers: <GaugePointer>[
            RangePointer(
              value:weatherController.weatherDaysModel.value.humidity,//humidity works as well
              width: 0.10,
              color: Colors.black54,
              cornerStyle: CornerStyle.bothCurve,
              sizeUnit: GaugeSizeUnit.factor,
            )
          ],
          axisLineStyle: const AxisLineStyle(
            thickness: 0.1,
            cornerStyle: CornerStyle.bothCurve,
            color: Colors.white,//black54,//Color.fromARGB(30, 0, 169, 181),
            thicknessUnit: GaugeSizeUnit.factor,
          ),
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                positionFactor: 0.1,
                angle: 90,
                widget: Text(
                  '${weatherController.weatherDaysModel.value.humidity.toStringAsFixed(0)} / 100',
                  style: const TextStyle(fontSize: 11,color: Colors.black),
                )),
            const GaugeAnnotation(
              positionFactor: 1.1,
              angle: 130,
              widget: Text(
                '0',
                style: TextStyle(fontSize: 11,color: Colors.black),
              ),
            ),
            // Annotation for the end of the progress bar
            const GaugeAnnotation(
              positionFactor: 1.1,
              angle: 50,
              widget: Text(
                '100',
                style: TextStyle(fontSize: 11,color: Colors.black),
              ),
            ),
          ],
        ),
      ]),),
    );
  }
}
