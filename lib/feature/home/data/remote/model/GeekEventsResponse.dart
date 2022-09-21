import 'dart:convert';

GeekEventsResponse geekEventsResponseFromJson(String str) =>
    GeekEventsResponse.fromJson(json.decode(str));

String geekEventsResponseToJson(GeekEventsResponse data) =>
    json.encode(data.toJson());

class GeekEventsResponse {
  GeekEventsResponse({
    Stats? stats,
    String? title,
    String? url,
    String? datetimeLocal,
    List<Performers>? performers,
    Venue? venue,
    String? shortTitle,
    String? datetimeUtc,
    num? score,
    List<Taxonomies>? taxonomies,
    String? type,
    num? id,
  }) {
    _stats = stats;
    _title = title;
    _url = url;
    _datetimeLocal = datetimeLocal;
    _performers = performers;
    _venue = venue;
    _shortTitle = shortTitle;
    _datetimeUtc = datetimeUtc;
    _score = score;
    _taxonomies = taxonomies;
    _type = type;
    _id = id;
  }

  GeekEventsResponse.fromJson(dynamic json) {
    _stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null;
    _title = json['title'];
    _url = json['url'];
    _datetimeLocal = json['datetime_local'];
    if (json['performers'] != null) {
      _performers = [];
      json['performers'].forEach((v) {
        _performers?.add(Performers.fromJson(v));
      });
    }
    _venue = json['venue'] != null ? Venue.fromJson(json['venue']) : null;
    _shortTitle = json['short_title'];
    _datetimeUtc = json['datetime_utc'];
    _score = json['score'];
    if (json['taxonomies'] != null) {
      _taxonomies = [];
      json['taxonomies'].forEach((v) {
        _taxonomies?.add(Taxonomies.fromJson(v));
      });
    }
    _type = json['type'];
    _id = json['id'];
  }

  Stats? _stats;
  String? _title;
  String? _url;
  String? _datetimeLocal;
  List<Performers>? _performers;
  Venue? _venue;
  String? _shortTitle;
  String? _datetimeUtc;
  num? _score;
  List<Taxonomies>? _taxonomies;
  String? _type;
  num? _id;

  Stats? get stats => _stats;

  String? get title => _title;

  String? get url => _url;

  String? get datetimeLocal => _datetimeLocal;

  List<Performers>? get performers => _performers;

  Venue? get venue => _venue;

  String? get shortTitle => _shortTitle;

  String? get datetimeUtc => _datetimeUtc;

  num? get score => _score;

  List<Taxonomies>? get taxonomies => _taxonomies;

  String? get type => _type;

  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_stats != null) {
      map['stats'] = _stats?.toJson();
    }
    map['title'] = _title;
    map['url'] = _url;
    map['datetime_local'] = _datetimeLocal;
    if (_performers != null) {
      map['performers'] = _performers?.map((v) => v.toJson()).toList();
    }
    if (_venue != null) {
      map['venue'] = _venue?.toJson();
    }
    map['short_title'] = _shortTitle;
    map['datetime_utc'] = _datetimeUtc;
    map['score'] = _score;
    if (_taxonomies != null) {
      map['taxonomies'] = _taxonomies?.map((v) => v.toJson()).toList();
    }
    map['type'] = _type;
    map['id'] = _id;
    return map;
  }
}

Taxonomies taxonomiesFromJson(String str) =>
    Taxonomies.fromJson(json.decode(str));

String taxonomiesToJson(Taxonomies data) => json.encode(data.toJson());

class Taxonomies {
  Taxonomies({
    dynamic parentId,
    num? id,
    String? name,
  }) {
    _parentId = parentId;
    _id = id;
    _name = name;
  }

  Taxonomies.fromJson(dynamic json) {
    _parentId = json['parent_id'];
    _id = json['id'];
    _name = json['name'];
  }

  dynamic _parentId;
  num? _id;
  String? _name;

  dynamic get parentId => _parentId;

  num? get id => _id;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['parent_id'] = _parentId;
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }
}

Venue venueFromJson(String str) => Venue.fromJson(json.decode(str));

String venueToJson(Venue data) => json.encode(data.toJson());

class Venue {
  Venue({
    String? city,
    String? name,
    dynamic extendedAddress,
    String? url,
    String? country,
    String? state,
    num? score,
    String? postalCode,
    Location? location,
    dynamic address,
    num? id,
  }) {
    _city = city;
    _name = name;
    _extendedAddress = extendedAddress;
    _url = url;
    _country = country;
    _state = state;
    _score = score;
    _postalCode = postalCode;
    _location = location;
    _address = address;
    _id = id;
  }

  Venue.fromJson(dynamic json) {
    _city = json['city'];
    _name = json['name'];
    _extendedAddress = json['extended_address'];
    _url = json['url'];
    _country = json['country'];
    _state = json['state'];
    _score = json['score'];
    _postalCode = json['postal_code'];
    _location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    _address = json['address'];
    _id = json['id'];
  }

  String? _city;
  String? _name;
  dynamic _extendedAddress;
  String? _url;
  String? _country;
  String? _state;
  num? _score;
  String? _postalCode;
  Location? _location;
  dynamic _address;
  num? _id;

  String? get city => _city;

  String? get name => _name;

  dynamic get extendedAddress => _extendedAddress;

  String? get url => _url;

  String? get country => _country;

  String? get state => _state;

  num? get score => _score;

  String? get postalCode => _postalCode;

  Location? get location => _location;

  dynamic get address => _address;

  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = _city;
    map['name'] = _name;
    map['extended_address'] = _extendedAddress;
    map['url'] = _url;
    map['country'] = _country;
    map['state'] = _state;
    map['score'] = _score;
    map['postal_code'] = _postalCode;
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['address'] = _address;
    map['id'] = _id;
    return map;
  }
}

Location locationFromJson(String str) => Location.fromJson(json.decode(str));

String locationToJson(Location data) => json.encode(data.toJson());

class Location {
  Location({
    num? lat,
    num? lon,
  }) {
    _lat = lat;
    _lon = lon;
  }

  Location.fromJson(dynamic json) {
    _lat = json['lat'];
    _lon = json['lon'];
  }

  num? _lat;
  num? _lon;

  num? get lat => _lat;

  num? get lon => _lon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = _lat;
    map['lon'] = _lon;
    return map;
  }
}

Performers performersFromJson(String str) =>
    Performers.fromJson(json.decode(str));

String performersToJson(Performers data) => json.encode(data.toJson());

class Performers {
  Performers({
    String? name,
    String? shortName,
    String? url,
    String? image,
    Images? images,
    bool? primary,
    num? id,
    num? score,
    String? type,
    String? slug,
  }) {
    _name = name;
    _shortName = shortName;
    _url = url;
    _image = image;
    _images = images;
    _primary = primary;
    _id = id;
    _score = score;
    _type = type;
    _slug = slug;
  }

  Performers.fromJson(dynamic json) {
    _name = json['name'];
    _shortName = json['short_name'];
    _url = json['url'];
    _image = json['image'];
    _images = json['images'] != null ? Images.fromJson(json['images']) : null;
    _primary = json['primary'];
    _id = json['id'];
    _score = json['score'];
    _type = json['type'];
    _slug = json['slug'];
  }

  String? _name;
  String? _shortName;
  String? _url;
  String? _image;
  Images? _images;
  bool? _primary;
  num? _id;
  num? _score;
  String? _type;
  String? _slug;

  String? get name => _name;

  String? get shortName => _shortName;

  String? get url => _url;

  String? get image => _image;

  Images? get images => _images;

  bool? get primary => _primary;

  num? get id => _id;

  num? get score => _score;

  String? get type => _type;

  String? get slug => _slug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['short_name'] = _shortName;
    map['url'] = _url;
    map['image'] = _image;
    if (_images != null) {
      map['images'] = _images?.toJson();
    }
    map['primary'] = _primary;
    map['id'] = _id;
    map['score'] = _score;
    map['type'] = _type;
    map['slug'] = _slug;
    return map;
  }
}

Images imagesFromJson(String str) => Images.fromJson(json.decode(str));

String imagesToJson(Images data) => json.encode(data.toJson());

class Images {
  Images({
    String? large,
    String? huge,
    String? small,
    String? medium,
  }) {
    _large = large;
    _huge = huge;
    _small = small;
    _medium = medium;
  }

  Images.fromJson(dynamic json) {
    _large = json['large'];
    _huge = json['huge'];
    _small = json['small'];
    _medium = json['medium'];
  }

  String? _large;
  String? _huge;
  String? _small;
  String? _medium;

  String? get large => _large;

  String? get huge => _huge;

  String? get small => _small;

  String? get medium => _medium;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['large'] = _large;
    map['huge'] = _huge;
    map['small'] = _small;
    map['medium'] = _medium;
    return map;
  }
}

Stats statsFromJson(String str) => Stats.fromJson(json.decode(str));

String statsToJson(Stats data) => json.encode(data.toJson());

class Stats {
  Stats({
    num? listingCount,
    num? averagePrice,
    num? lowestPrice,
    num? highestPrice,
  }) {
    _listingCount = listingCount;
    _averagePrice = averagePrice;
    _lowestPrice = lowestPrice;
    _highestPrice = highestPrice;
  }

  Stats.fromJson(dynamic json) {
    _listingCount = json['listing_count'];
    _averagePrice = json['average_price'];
    _lowestPrice = json['lowest_price'];
    _highestPrice = json['highest_price'];
  }

  num? _listingCount;
  num? _averagePrice;
  num? _lowestPrice;
  num? _highestPrice;

  num? get listingCount => _listingCount;

  num? get averagePrice => _averagePrice;

  num? get lowestPrice => _lowestPrice;

  num? get highestPrice => _highestPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['listing_count'] = _listingCount;
    map['average_price'] = _averagePrice;
    map['lowest_price'] = _lowestPrice;
    map['highest_price'] = _highestPrice;
    return map;
  }
}
