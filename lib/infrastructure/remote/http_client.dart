import 'dart:async';
import 'package:testing/infrastructure/remote/model/response_api.dart';

abstract class HttpClient {
  Future<ResponseAPI> get(String url);
}