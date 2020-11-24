import 'package:flutter_test/flutter_test.dart';
import 'package:testing/features/user_summary/domain/user_summary_interactor.dart';

import 'user_summary_presenter_mock.dart';
import 'user_summary_router_mock.dart';
import 'user_summary_view_with_bloc_mock.dart';

void main() {
  group('UserSummaryPresenter Class', () {
    UserSummaryInteractor sut;
    UserSummaryPresenterMock presenterMock;
    UserSummaryRouterMock routerMock;
    UserSummaryViewWithBlocMock viewMock;

    setUpAll(() {
      sut = UserSummaryInteractor();
      routerMock = UserSummaryRouterMock();
      viewMock = UserSummaryViewWithBlocMock();
      presenterMock = UserSummaryPresenterMock();

      presenterMock.userSummaryRoutable = routerMock;
      presenterMock.userSummaryInteractable = sut;

      sut.userSummaryPresentable = presenterMock;
    });

    tearDownAll(() {
      sut = null;
      routerMock = null;
      viewMock = null;
      presenterMock = null;
    });

    test('After execute retrieveUser is expected 1', () async {
      await sut.retrieveUsers();
      expect(presenterMock.callsToAvailableDidRetrieveUserSummary, 1);
    });
  });
}
