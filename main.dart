import 'package:flutter/material.dart';
import 'package:tutorial001/clock.dart';
import 'package:tutorial001/widgets/analog_clock.dart';
import 'dart:math';

import 'pages/location_detail.dart';
import 'pages/choose_location.dart';
import 'pages/loading.dart';
import 'pages/home.dart';

void main(List<String> args) {
  runApp(myApp);
}

MaterialApp myApp = MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) => const Loading(),
    '/home': (context) => const Home(),
    '/location': (context) => const ChooseLocation(),
    '/locationdetail': (context) => const LocationDetail(),
    '/analogclock': (context) => const Clock(),
  },
);
