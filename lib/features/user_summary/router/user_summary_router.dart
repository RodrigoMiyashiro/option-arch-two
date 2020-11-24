import 'package:flutter/material.dart';
import 'package:testing/features/user_summary/domain/user_summary_interactable.dart';
import 'package:testing/features/user_summary/domain/user_summary_interactor.dart';
import 'package:testing/features/user_summary/presenter/user_summary_presentable.dart';
import 'package:testing/features/user_summary/presenter/user_summary_presenter.dart';
import 'package:testing/features/user_summary/router/user_summary_routable.dart';
import 'package:testing/features/user_summary/ui/user_summary_viewable.dart';
import 'package:testing/shared/model/simple_alert_dto.dart';
import 'package:testing/shared/ui/widgets/simple_alert.dart';
import 'package:testing/features/user_summary/ui/user_summary_view_with_bloc.dart';

class UserSummaryRouter implements UserSummaryRoutable {
  @override
  StatefulWidget createModule() {
    UserSummaryInteractable userSummaryInteractable = UserSummaryInteractor();
    UserSummaryPresentable userSummaryPresentable = UserSummaryPresenter();
    UserSummaryViewable userSummaryViewable = UserSummaryViewWithBloC();

    userSummaryPresentable.userSummaryInteractable = userSummaryInteractable;
    userSummaryPresentable.userSummaryRoutable = this;
    userSummaryViewable.userSummaryPresenter = userSummaryPresentable;
    userSummaryInteractable.userSummaryPresentable = userSummaryPresentable;

    return userSummaryViewable;
  }

  @override
  void navigateTo(BuildContext context, String routerName) {
    Navigator.of(context).pushNamed(routerName);
  }

  @override
  void showAlert(BuildContext context, SimpleAlertDTO simpleAlertDTO) {
    SimpleAlert simpleAlert = SimpleAlert(simpleAlertDTO: simpleAlertDTO);
    simpleAlert.build(context);
  }

  @override
  void closeView(BuildContext context) {
    Navigator.of(context).pop();
  }
}
