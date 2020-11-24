import 'package:flutter/src/widgets/framework.dart';
import 'package:testing/features/user_summary/domain/user_summary_interactable.dart';
import 'package:testing/features/user_summary/presenter/user_summary_presenter_controllable.dart';
import 'package:testing/features/user_summary/router/user_summary_routable.dart';
import 'package:testing/shared/model/simple_alert_dto.dart';
import 'package:testing/shared/model/user.dart';
import 'package:testing/features/user_summary/presenter/user_summary_bloc.dart';

class UserSummaryPresenterMock implements UserSummaryPresenterControllable {
  int callsToAvailableCloseView = 0;
  int callsToAvailableDidRetrieveUserSummary = 0;
  int callsToAvailableSelectedCell = 0;
  int callsToAvailableShowAlert = 0;
  int callsToAvailableViewWillAppear = 0;

  @override
  UserSummaryBlocable userSummaryBlocable;
  @override
  UserSummaryInteractable userSummaryInteractable;
  @override
  UserSummaryRoutable userSummaryRoutable;

  @override
  void closeView(BuildContext context) {
    callsToAvailableCloseView += 1;
    userSummaryRoutable.closeView(context);
  }

  @override
  void didRetrieveUserSummary({List<User> users}) {
    callsToAvailableDidRetrieveUserSummary += 1;
    userSummaryBlocable.onChangeValue(users: users);
  }

  @override
  void selectedCell(BuildContext context) {
    callsToAvailableSelectedCell += 1;
    userSummaryRoutable.navigateTo(context, 'routerName');
  }

  @override
  void showAlert(BuildContext context, SimpleAlertDTO simpleAlertDTO) {
    callsToAvailableShowAlert += 1;
    userSummaryRoutable.showAlert(context, simpleAlertDTO);
  }

  @override
  void viewWillAppear() {
    callsToAvailableViewWillAppear += 1;
    userSummaryInteractable.retrieveUsers();
  }
}
