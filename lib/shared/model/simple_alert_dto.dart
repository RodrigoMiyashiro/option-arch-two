import 'package:testing/shared/ui/widgets/simple_alert.dart';

class SimpleAlertDTO {
  String title;
  String description;
  String buttonTitle;
  DismissableView removeAlert;

  SimpleAlertDTO(
      {this.title, this.description, this.buttonTitle, this.removeAlert});
}
