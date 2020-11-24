import 'package:flutter/cupertino.dart';
import 'package:testing/features/user_summary/domain/user_summary_interactable.dart';
import 'package:testing/features/user_summary/presenter/user_summary_presenter_controllable.dart';
import 'package:testing/features/user_summary/router/user_summary_routable.dart';
import 'package:testing/shared/model/simple_alert_dto.dart';
import 'package:testing/shared/model/user.dart';
import 'package:testing/features/user_summary/presenter/user_summary_bloc.dart';

class UserSummaryPresenter implements UserSummaryPresenterControllable {
  @override
  UserSummaryBlocable userSummaryBlocable;
  @override
  UserSummaryInteractable userSummaryInteractable;
  @override
  UserSummaryRoutable userSummaryRoutable;

  @override
  void didRetrieveUserSummary({List<User> users}) {
    if (users == null) {
      return;
    }
    userSummaryBlocable.onChangeValue(users: users);
  }

  @override
  void viewWillAppear() {
    userSummaryInteractable.retrieveUsers();
  }

  @override
  void selectedCell(BuildContext context) {
    userSummaryRoutable.navigateTo(context, 'routerName');
  }

  @override
  void showAlert(BuildContext context, SimpleAlertDTO simpleAlertDTO) {
    userSummaryRoutable.showAlert(context, simpleAlertDTO);
  }

  @override
  void closeView(BuildContext context) {
    userSummaryRoutable.closeView(context);
  }
}
