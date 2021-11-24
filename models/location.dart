class Location {
  String? _city;
  String? _continent;
  String? _url;

  Location([this._city, this._continent]);

  String? get city => _city;
  String? get continent => _continent;
  String? get url => _url;
  Location.byUrl(String url) {
    List<String> splitted = url.split('/');
    _city = splitted.last;
    _continent = splitted.first;
    _url = url;
  }
}
