import 'package:testing/shared/model/address.dart';
import 'package:testing/shared/model/company.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.address,
      this.phone,
      this.website,
      this.company});

  factory User.fromJSON(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: Address.fromJSON(json['address']),
      phone: json['phone'],
      website: json['website'],
      company: Company.fromJSON(json['company']),
    );
  }
}
