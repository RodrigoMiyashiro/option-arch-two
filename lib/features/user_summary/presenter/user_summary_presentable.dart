import 'package:flutter/material.dart';
import 'package:testing/features/user_summary/domain/user_summary_interactable.dart';
import 'package:testing/features/user_summary/presenter/user_summary_bloc.dart';
import 'package:testing/features/user_summary/router/user_summary_routable.dart';
import 'package:testing/shared/model/simple_alert_dto.dart';
import 'package:testing/shared/model/user.dart';

abstract class UserSummaryPresentable {
  UserSummaryBlocable userSummaryBlocable;
  UserSummaryInteractable userSummaryInteractable;
  UserSummaryRoutable userSummaryRoutable;
  void didRetrieveUserSummary({List<User> users});
  void selectedCell(BuildContext context);
  void showAlert(BuildContext context, SimpleAlertDTO simpleAlertDTO);
  void closeView(BuildContext context);
}
