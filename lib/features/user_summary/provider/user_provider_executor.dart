import 'package:flutter/cupertino.dart';
import 'package:testing/features/user_summary/provider/user_provider.dart';
import 'package:testing/infrastructure/remote/http_client.dart';
import 'package:testing/infrastructure/remote/model/response_api.dart';
import 'package:testing/infrastructure/remote/path/remote_address.dart';
import 'package:testing/shared/model/user.dart';

class UserProviderExecutor implements UserProvider {
  final HttpClient client;

  UserProviderExecutor({Key key, @required this.client});

  @override
  Future<List> obtainUsers() async {
    final remoteAddress = RemoteAddress(path: "users");
    final url = remoteAddress.obtainEndpoint();
    final ResponseAPI response = await client.get(url);

    if (response == null) {
      return null;
    }

    if (response.error != null) {
      throw Exception(response.error);
    }

    Iterable iterable = response.result;
    List<User> users = iterable.map((model) => User.fromJSON(model)).toList();

    return users;
  }
}
