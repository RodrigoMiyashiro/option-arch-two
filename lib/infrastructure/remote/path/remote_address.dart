import 'package:flutter/cupertino.dart';
import 'package:testing/infrastructure/remote/path/remote_provider.dart';

class RemoteAddress extends RemoteProvider {
  String path;

  RemoteAddress({ @required this.path });

  String obtainEndpoint() {
    return baseRemoteAddress() + path;
  }
}