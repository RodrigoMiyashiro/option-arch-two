import 'package:flutter/material.dart';
import 'package:testing/shared/model/simple_alert_dto.dart';

abstract class UserSummaryRoutable {
  StatefulWidget createModule();
  void navigateTo(BuildContext context, String routerName);
  void showAlert(BuildContext context, SimpleAlertDTO simpleAlertDTO);
  void closeView(BuildContext context);
}
