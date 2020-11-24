import 'package:flutter_test/flutter_test.dart';
import 'package:testing/features/user_summary/presenter/user_summary_presenter.dart';
import 'package:testing/features/user_summary/presenter/user_summary_presenter_controllable.dart';
import 'package:testing/shared/model/simple_alert_dto.dart';
import 'package:testing/shared/model/user.dart';
import '../../mock/json_parser.dart';
import 'user_summary_bloc_mock.dart';
import 'user_summary_interactor_mock.dart';
import 'user_summary_router_mock.dart';
import 'user_summary_view_with_bloc_mock.dart';

void main() {
  group('UserSummaryInteractor Class', () {
    UserSummaryPresenterControllable sut;
    UserSummaryInteractorMock interactorMock;
    UserSummaryRouterMock routerMock;
    UserSummaryViewWithBlocMock viewWithBlocMock;
    UserSummaryBlocMock userSummaryBlocMock;

    List<User> usersMock;

    loadUsersMock() async {
      usersMock = await UserMock.users;
    }

    setUpAll(() {
      sut = UserSummaryPresenter();
      interactorMock = UserSummaryInteractorMock();
      routerMock = UserSummaryRouterMock();
      viewWithBlocMock = UserSummaryViewWithBlocMock();
      userSummaryBlocMock = UserSummaryBlocMock();

      sut.userSummaryInteractable = interactorMock;
      sut.userSummaryRoutable = routerMock;
      sut.userSummaryBlocable = userSummaryBlocMock;

      interactorMock.userSummaryPresentable = sut;

      loadUsersMock();
    });

    tearDownAll(() {
      sut = null;
      interactorMock = null;
      routerMock = null;
      viewWithBlocMock = null;
    });

    test('viewWillAppear', () {
      sut.viewWillAppear();
      expect(interactorMock.callToAvailableRetrieveUsers, 1);
    });

    test('selectedCell', () {
      sut.selectedCell(viewWithBlocMock.createState().context);
      expect(routerMock.callsToAvailableNavigateTo, 1);
    });

    test('showAlert', () {
      sut.showAlert(viewWithBlocMock.createState().context, SimpleAlertDTO());
      expect(routerMock.callsToAvailableShowAlert, 1);
    });

    test('closeView', () {
      sut.closeView(viewWithBlocMock.createState().context);
      expect(routerMock.callsToAvailableCloseView, 1);
    });

    test('didRetrieveUserSummary', () {
      sut.didRetrieveUserSummary(users: usersMock);
      expect(userSummaryBlocMock.callsToAvailableOnChangeValue, 1);
    });
  });
}
