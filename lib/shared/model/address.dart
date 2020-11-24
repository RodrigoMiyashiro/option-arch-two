import 'package:testing/shared/model/geolocation.dart';

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geolocation geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  factory Address.fromJSON(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: Geolocation.fromJSON(json['geo']),
    );
  }
}
