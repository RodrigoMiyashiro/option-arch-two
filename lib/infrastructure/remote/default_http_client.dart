import 'package:testing/infrastructure/remote/model/response_api.dart';
import 'package:testing/infrastructure/remote/http_client.dart';
import 'package:http/http.dart' as http;

class DefaultHTTPClient implements HttpClient {
  @override
  Future<ResponseAPI> get(String url) async {
    try {
      http.Response response = await http.get(url);
      return ResponseAPI.fromResponse(response);
    } catch (e){
      throw Exception("ErRoR.... ${e.toString()}");
    }
  }
}