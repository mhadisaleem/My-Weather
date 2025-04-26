import 'package:flutter/material.dart';
class DegreeWidget extends StatelessWidget {
  const DegreeWidget({
    super.key,
    required this.temp,
    required this.tFontSize,
    required this.dFontSize,
    required this.offSetVal,
  });

  final String temp;
  final double dFontSize;
  final double tFontSize;
  final double offSetVal;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: temp,
            style: TextStyle(
              color: Colors.white70,
              fontSize: tFontSize, //
            ),
          ),
          WidgetSpan(
            //https://medium.com/@anna_muzykina/superscript-and-subscript-text-in-flutter-2d4f76ef18d3
            child: Transform.translate(
              offset: Offset(0.0, offSetVal), //38
              child: Text(
                '\u00b0',
                style: TextStyle(fontSize: dFontSize, color: Colors.white), //35
              ),
            ),
          ),
        ],
      ),
    );
  }
}