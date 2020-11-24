import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:testing/shared/model/user.dart';
import 'package:testing/features/user_summary/presenter/user_summary_bloc.dart';

class UserSummaryBlocMock extends BlocBase implements UserSummaryBlocable {
  var callsToAvailableOnChangeValue = 0;

  StreamController<List<User>> _usersController = StreamController.broadcast();

  List<User> _allUsers = List<User>();

  @override
  Stream<List<User>> get obtainAllUse => _usersController.stream;

  @override
  onChangeValue({List<User> users}) {
    callsToAvailableOnChangeValue += 1;
  }

  @override
  void dispose() {
    _usersController.close();
    super.dispose();
  }
}
