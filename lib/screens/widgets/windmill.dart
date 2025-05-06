import 'dart:math';

import 'package:flutter/material.dart';

class WindmillScreenPoleGround extends StatefulWidget {
  const WindmillScreenPoleGround({super.key});

  @override
  WindmillScreenState createState() => WindmillScreenState();
}

class WindmillScreenState extends State<WindmillScreenPoleGround>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            WindmillBody(),
            WindmillBlades(controller: _controller),
          ],
        ),
      ),
    );
  }
}

class WindmillBody extends StatelessWidget {
  const WindmillBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(100, 200),
      painter: WindmillBodyPainter(),
    );
  }
}

class WindmillBodyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Define the widths of the pole at the top and bottom
    double topWidth = 3;//6->2
    double bottomWidth = 8;//16->8
    double poleHeight = size.height / 2;

    // Define the positions of the top and bottom of the pole
    double topLeft = (size.width - topWidth) / 2;
    double topRight = topLeft + topWidth;
    double bottomLeft = (size.width - bottomWidth) / 2;
    double bottomRight = bottomLeft + bottomWidth;

    // Create a path for the pole
    Path polePath = Path()
      ..moveTo(topLeft, size.height - poleHeight)
      ..lineTo(topRight, size.height - poleHeight)
      ..lineTo(bottomRight, size.height)
      ..lineTo(bottomLeft, size.height)
      ..close();

    // Draw the pole
    canvas.drawPath(polePath, paint);

    // Drawing the blades holder (small circle)
    canvas.drawCircle(Offset(size.width / 2, size.height - poleHeight), 5, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class WindmillBlades extends StatelessWidget {
  final AnimationController controller;

  const WindmillBlades({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: controller.value * 2 * pi,
          child: CustomPaint(
            size: Size(100, 100),
            painter: WindmillBladesPainter(),
          ),
        );
      },
    );
  }
}

class WindmillBladesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    // Drawing the blades
    double bladeLength = size.width / 2;
    Offset center = Offset(size.width / 2, size.height / 2);

    for (int i = 0; i < 3; i++) {
      double angle = i * 2 * pi / 3;
      Offset bladeEnd = Offset(
        center.dx + bladeLength * cos(angle),
        center.dy + bladeLength * sin(angle),
      );
      canvas.drawLine(center, bladeEnd, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
