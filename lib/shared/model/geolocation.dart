class Geolocation {
  final String lat;
  final String lng;

  Geolocation({
    this.lat,
    this.lng
  });

  factory Geolocation.fromJSON(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    return Geolocation(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}
