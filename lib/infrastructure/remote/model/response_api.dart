import 'dart:convert';
import 'package:http/http.dart' as http;

class ResponseAPI<T> {
  T result;
  int statusCode;
  String error;

  ResponseAPI({ this.result, this.statusCode, this.error });

  factory ResponseAPI.fromResponse(http.Response response) {
    if (response == null) return null;

    String utf8DecodedString = utf8.decode(response.bodyBytes);

    return ResponseAPI(
      statusCode: response.statusCode,
      result: response.statusCode == 200 ? jsonDecode(utf8DecodedString) : null,
      error: response.statusCode != 200 ? "ErRor..." : null
    );
  }
}