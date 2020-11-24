import 'package:flutter/material.dart';
import 'package:testing/shared/model/simple_alert_dto.dart';

abstract class DismissableView {
  void dismiss(BuildContext context);
}

class SimpleAlert {
  SimpleAlertDTO _simpleAlertDTO;

  SimpleAlert({SimpleAlertDTO simpleAlertDTO})
      : _simpleAlertDTO = simpleAlertDTO;

  build(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext buildContext) {
        return AlertDialog(
          title: Text(_simpleAlertDTO.title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(_simpleAlertDTO.description),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(_simpleAlertDTO.buttonTitle),
              onPressed: () {
                _simpleAlertDTO.removeAlert.dismiss(context);
              },
            ),
          ],
        );
      },
    );
  }
}
