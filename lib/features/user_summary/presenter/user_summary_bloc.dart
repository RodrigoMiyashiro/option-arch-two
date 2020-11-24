import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:testing/shared/model/user.dart';

abstract class UserSummaryBlocable {
  onChangeValue({List<User> users});
  Stream<List<User>> get obtainAllUse;
}

class UserSummaryBloc extends BlocBase implements UserSummaryBlocable {
  StreamController<List<User>> _usersController = StreamController.broadcast();

  List<User> _allUsers = List<User>();

  @override
  Stream<List<User>> get obtainAllUse => _usersController.stream;

  onChangeValue({List<User> users}) {
    if (users == null) {
      return;
    }

    this._allUsers = users;

    _usersController.add(this._allUsers);
  }

  @override
  void dispose() {
    _usersController.close();
    super.dispose();
  }
}
