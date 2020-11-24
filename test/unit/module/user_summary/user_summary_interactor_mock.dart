import 'package:testing/features/user_summary/domain/user_summary_interactable.dart';
import 'package:testing/features/user_summary/presenter/user_summary_presentable.dart';

import '../../mock/json_parser.dart';

class UserSummaryInteractorMock implements UserSummaryInteractable {
  int callToAvailableRetrieveUsers = 0;

  @override
  UserSummaryPresentable userSummaryPresentable;

  @override
  void retrieveUsers() {
    callToAvailableRetrieveUsers += 1;
    userSummaryPresentable.didRetrieveUserSummary();
  }
}
