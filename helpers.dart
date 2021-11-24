import 'package:intl/intl.dart';
import 'models/timezone.dart';

class Helpers {
  static String getTime() {
    return '';
  }

  static DateTime stringToDateTime(TimeZoneModel? data) {
    String? datetime = data!.datetime; 
    String offset = data.utcOffset!.substring(0,3);
    DateTime now = DateTime.parse(datetime!);
    now = now.add(Duration(hours: int.parse(offset)));

    return now;
  }

  static String formatTime(TimeZoneModel? time) {
    DateTime now = stringToDateTime(time);
 
    return DateFormat.jm().format(now);
  }

  static String formatDate(TimeZoneModel? data){
    DateTime now = stringToDateTime(data);

    return DateFormat.yMMMMEEEEd().format(now);
  }

}
