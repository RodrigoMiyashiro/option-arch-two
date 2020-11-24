import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:testing/shared/model/user.dart';

abstract class Parsable {
  Future<String> obtainFile(String path);
}

class JSONParser implements Parsable {
  Future<String> obtainFile(String path) async {
    return await rootBundle.loadString(path);
  }
}

abstract class GenerationMock {
  Parsable parser;
  String path;

  Future<List> generate();
}

class ObtainUserMock implements GenerationMock {
  @override
  Parsable parser;
  @override
  String path;

  ObtainUserMock({this.parser, this.path});

  @override
  Future<List> generate() async {
    final objectString = mapJSON;
    final objectResponse = json.decode(objectString);

    Iterable iterable = objectResponse;
    List<User> users = iterable.map((model) => User.fromJSON(model)).toList();

    return users;
  }
}

class UserMock {
  static Future<List<User>> get users async {
    Parsable parse = JSONParser();
    GenerationMock mock =
        ObtainUserMock(path: 'assets/user_mock.json', parser: parse);

    return await mock.generate();
  }
}

final mapJSON =
    '[{"id": 1,"name": "Leanne Graham","username": "Bret","email": "Sincere@april.biz","address": {"street": "Kulas Light","suite": "Apt. 556","city": "Gwenborough","zipcode": "92998-3874","geo": {"lat": "-37.3159","lng": "81.1496"}},"phone": "1-770-736-8031 x56442","website": "hildegard.org","company": {"name": "Romaguera-Crona","catchPhrase": "Multi-layered client-server neural-net","bs": "harness real-time e-markets"}}]';
