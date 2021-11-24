import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tutorial001/widgets/analog_clock.dart';

import 'helpers.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(50),
        width: 250,
        height: 250,
        color: Colors.grey,
        child: Transform.rotate(
          angle: -pi / 2,
          child: Circle(
            radius: 100,
            dateTime: DateTime.now(),
          ),
        ),
      ),
    );
  }
}
