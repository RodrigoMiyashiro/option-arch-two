import 'package:testing/features/user_summary/presenter/user_summary_presentable.dart';

abstract class UserSummaryInteractable {
  UserSummaryPresentable userSummaryPresentable;

  void retrieveUsers();
}
