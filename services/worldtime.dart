import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

import '../models/timezone.dart';
import '../models/location.dart';

class WorldTimeService {
  final String? timezone;
  static const String mainUrl = 'worldtimeapi.org';
  static const String pathUrl = '/api/timezone/';

  WorldTimeService({this.timezone});

  static Future<TimeZoneModel> getLocationTime(Location location) async {
    String url = '$pathUrl${location.url}';
    try {
      Response response = await get(Uri.http(mainUrl, url));
      Map data = jsonDecode(response.body);
      TimeZoneModel locationtime = TimeZoneModel.fromJson(data);
      return locationtime;
    } catch (e) {
      return TimeZoneModel.error(error: 'Can not fetch timezone data');
    }
  }

  static Future<dynamic> getLocations([String? continent]) async {
    List<Location> locations = [];
    String customPathUrl = pathUrl;
    if (continent != null) {
      customPathUrl = '$customPathUrl$continent';
    }
    try {
      Response response = await get(Uri.http(mainUrl, customPathUrl));
      if (response.statusCode == 200) {
        dynamic data = jsonDecode(response.body);
        for (int i = 0; i < data.length; i++) {
          locations.add(Location.byUrl(data[i]));
        }
        return locations;
      } else {
        return [0];
      }
    } catch (e) {
      return [0];
    }
  }
}
