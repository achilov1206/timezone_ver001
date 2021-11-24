import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../models/timezone.dart';

class StorageService{
  static final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<bool> addToFavorite(TimeZoneModel data) async {
    final SharedPreferences prefs = await _prefs;
    var encoded = jsonEncode(data);
    prefs.setString('SavedLocation', encoded).then((bool success){
      print('SAVED');
      return true;
    });
    return false;
  }

  static Future<String> getFavorites() async{
    print('Fetch Location');
    await _prefs.then((SharedPreferences prefs){
      print(prefs.getString('SavedLocation'));
      return prefs.getString('SavedLocation');
    });
    return '';
  }

}