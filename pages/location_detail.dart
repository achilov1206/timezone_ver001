import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tutorial001/helpers.dart';
import 'package:tutorial001/models/location.dart';
import 'package:tutorial001/models/timezone.dart';
import 'package:tutorial001/services/storage.dart';
import 'package:tutorial001/services/worldtime.dart';
import 'package:tutorial001/widgets/analog_clock.dart';

import '../clock.dart';

class LocationDetail extends StatefulWidget {
  const LocationDetail({Key? key}) : super(key: key);

  @override
  _LocationDetailState createState() => _LocationDetailState();
}

class _LocationDetailState extends State<LocationDetail> {
  Future<TimeZoneModel>? timeOfLocation;

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Location location =
        ModalRoute.of(context)!.settings.arguments as Location;

    void updateTime() {
      timeOfLocation = WorldTimeService.getLocationTime(location);
    }

    setState(() {
      updateTime();
    });

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(
          '${location.city}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<TimeZoneModel>(
        future: timeOfLocation,
        builder: (BuildContext context, AsyncSnapshot<TimeZoneModel> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final data = snapshot.data;
            return Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Card(
                    color: Colors.white,
                    child: Container(
                      child: ListTile(
                        leading: TextButton.icon(
                          onPressed: () {
                            StorageService.addToFavorite(data!);
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.deepOrangeAccent,
                            size: 20,
                          ),
                          label: const Text(''),
                        ),
                        title: const Text('Add to favorite'),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            child: Transform.rotate(
                              angle: -pi / 2,
                              child: Circle(
                                radius: 100,
                                dateTime: Helpers.stringToDateTime(data),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            Helpers.formatTime(data),
                          ),
                          Text(
                            Helpers.formatDate(data),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
