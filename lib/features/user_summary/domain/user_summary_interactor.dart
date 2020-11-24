import 'package:testing/features/user_summary/domain/user_summary_interactable.dart';
import 'package:testing/features/user_summary/presenter/user_summary_presentable.dart';
import 'package:testing/features/user_summary/provider/user_provider_executor.dart';
import 'package:testing/infrastructure/remote/default_http_client.dart';
import 'package:testing/shared/model/user.dart';

class UserSummaryInteractor implements UserSummaryInteractable {
  @override
  UserSummaryPresentable userSummaryPresentable;

  @override
  void retrieveUsers() async {
    DefaultHTTPClient client = DefaultHTTPClient();
    UserProviderExecutor executor = UserProviderExecutor(client: client);

    try {
      List<User> users = await executor.obtainUsers();

      userSummaryPresentable.didRetrieveUserSummary(users: users);
    } catch (error) {
      // throw error
      print('Error interactor...');
    }
  }
}
