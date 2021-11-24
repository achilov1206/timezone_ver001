import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tutorial001/helpers.dart';

class Circle extends StatelessWidget {
  const Circle({
    Key? key,
    @required double? this.radius,
    @required DateTime? this.dateTime,
  }) : super(key: key);

  final double? radius;
  final DateTime? dateTime;

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _Painter(radius!, dateTime!),
      );
}

// class ClockStyle{
//   final Color circleColor;
//   final Color circleBackgroundColor;
//   final bool circleStore = true;

//   final Color secondHandColor;
//   final Color minuteHandColor;
//   final Color hourHandColor;

//   final double mainCircleStrokeWidth = 3.0;
//   final double centerDotStrokeWidth = 3.0;
// }

class _Painter extends CustomPainter {
  _Painter(this.radius, this.dateTime);

  final double radius;
  final DateTime dateTime;

  // void printTime(canvas, xCenter, yCenter) {
  //   final textSpan = TextSpan(
  //     text: Helpers.formatTime(dateTime),
  //     style: const TextStyle(color: Colors.black, fontSize: 20),
  //   );
  //   final textPainter = TextPainter(textDirection: TextDirection.ltr, text: textSpan);
  //   textPainter.layout(
  //     minWidth: 0,
  //     maxWidth: double.maxFinite,
  //   );
  //   final offset = Offset(xCenter, yCenter);
  //   textPainter.paint(canvas, offset);
  // }

  void drawMainCircle(canvas, Offset center, double radius) {
    Paint mainCirclePaint = Paint()
      ..color = Color(0xFFFFB74D)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    canvas.drawCircle(center, radius, mainCirclePaint);
  }

  void centerDotCirclePaint(canvas, Offset center, double radius) {
    Paint centerDotCirclePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..strokeWidth = 3.0;
    canvas.drawCircle(center, radius, centerDotCirclePaint);
  }

  void drawSecondHand(
      canvas, Offset center, double centerX, double centerY, double length) {
    double secondHandX =
        centerX + length * cos(dateTime.second * 6 * pi / 180);
    double secondHandY =
        centerX + length * sin(dateTime.second * 6 * pi / 180);

    Paint secondHandPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2;
    canvas.drawLine(center, Offset(secondHandX, secondHandY), secondHandPaint);
  }

  void drawMinuteHand(
      canvas, Offset center, double centerX, double centerY, double length) {
    double secondHandX =
        centerX + length * cos(dateTime.minute * 6 * pi / 180);
    double secondHandY =
        centerX + length * sin(dateTime.minute * 6 * pi / 180);

    Paint secondHandPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3;
    canvas.drawLine(center, Offset(secondHandX, secondHandY), secondHandPaint);
  }

  void drawHourHand(
      canvas, Offset center, double centerX, double centerY, double length) {
    double houreHandX = centerX +
        length *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    double houreHandY = centerX +
        length *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    Paint houreHandPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4;
    canvas.drawLine(center, Offset(houreHandX, houreHandY), houreHandPaint);
  }

  void drawInnerLines(canvas, Offset center, double centerX, double centerY) {
    double outerCircleRadius, innerCircleRadius;

    for (double i = 0; i < 360; i += 6) {
      if (i % 5 == 0) {
        innerCircleRadius = radius - 15;
        outerCircleRadius = radius + 10;
      } else {
        innerCircleRadius = radius - 10;
        outerCircleRadius = radius + 5;
      }
      double x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      double y1 = centerX + outerCircleRadius * sin(i * pi / 180);

      double x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      double y2 = centerX + innerCircleRadius * sin(i * pi / 180);

      canvas.drawLine(
        Offset(x1, y1),
        Offset(x2, y2),
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
      );
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    drawMainCircle(canvas, center, radius);
    centerDotCirclePaint(canvas, center, 3);

    //Second Hand
    drawSecondHand(canvas, center, centerX, centerY, (radius - 25));
    //Minute Hand
    drawMinuteHand(canvas, center, centerX, centerY, (radius - 35));
    //Houre Hand
    drawHourHand(canvas, center, centerX, centerY, (radius - 45));

    drawInnerLines(canvas, center, centerX, centerY);

    //printTime(canvas, centerX, centerY);
    // double angle = 0;
    // num _drawLetter(Canvas canvas, String letter, double prevAngle) {
    //   _textPainter.text = TextSpan(text: letter);
    //   _textPainter.layout(
    //     minWidth: 0,
    //     maxWidth: double.maxFinite,
    //   );

    //   final double d = _textPainter.width;
    //   final num alpha = 2 * asin(d / (2 * radius));

    //   final newAngle = angle + 30;
    //   canvas.rotate(newAngle);

    //   _textPainter.paint(canvas, Offset(0, -_textPainter.height));
    //   canvas.translate(d, 0);

    //   return alpha;
    // }
    //     List<String> text = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];
    // for (int i = 0; i < text.length; i++) {
    //   _drawLetter(canvas, text[i], angle);
    //   print(text[i]);
    // }
    //     _textPainter.text = TextSpan(text: '12');
    // _textPainter.layout(
    //   minWidth: 0,
    //   maxWidth: double.maxFinite,
    // );
    // _textPainter.paint(canvas, Offset(x1, y1));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
