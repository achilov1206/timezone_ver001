class TimeZoneModel {
  String? _abbreviation;
  String? _datetime;
  int? _day_of_week;
  int? _day_of_year;
  bool? _dst;
  dynamic _dst_from;
  int? _dst_offset;
  dynamic _dst_until;
  int? _raw_offset;
  String? _timezone;
  int? _unixtime;
  String? _utc_datetime;
  String? _utc_offset;
  int? _week_number;

  String? error;

  TimeZoneModel();

  TimeZoneModel.fromJson(Map<dynamic, dynamic> data) {
    _abbreviation = data['abbreviation'];
    _datetime = data['datetime'];
    _day_of_week = data['day_of_week'];
    _day_of_year = data['day_of_year'];
    _dst = data['dst'];
    _dst_from = data['dst_from'];
    _dst_offset = data['dst_offset'];
    _dst_until = data['dst_until'];
    _raw_offset = data['raw_offset'];
    _timezone = data['timezone'];
    _unixtime = data['unixtime'];
    _utc_datetime = data['utc_datetime'];
    _utc_offset = data['utc_offset'];
    _week_number = data['week_number'];
  }
  Map<String, dynamic> toJson() => {
        'abbreviation': _abbreviation,
        'datetime': _datetime,
        'day_of_week': _day_of_week,
        'day_of_year': _day_of_year,
        'dst': _dst,
        'dst_from': _dst_from,
        'dst_offset': _dst_offset,
        'dst_until': _dst_until,
        'raw_offset': _raw_offset,
        'timezone': _timezone,
        'unixtime': _unixtime,
        'utc_datetime': _utc_datetime,
        'utc_offset': _utc_offset,
        'week_number': _week_number,
      };

  TimeZoneModel.error({this.error});

  String? get abbreviation => _abbreviation;
  String? get datetime => _datetime;
  int? get dayOfWeek => _day_of_week;
  int? get dayOfYear => _day_of_year;
  bool? get dst => _dst;
  dynamic get dstFrom => _dst_from;
  int? get dstOffset => _dst_offset;
  dynamic get dstUntil => _dst_until;
  int? get rawOffset => _raw_offset;
  String? get timezone => _timezone;
  int? get unixTime => _unixtime;
  String? get utcDatetime => _utc_datetime;
  String? get utcOffset => _utc_offset;
  int? get weekNumber => _week_number;
}
