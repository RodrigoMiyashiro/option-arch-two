import 'package:flutter/material.dart';
import 'package:testing/shared/model/user.dart';
import 'package:testing/shared/ui/view_component/placeholder_center_view.dart';
import 'package:testing/shared/ui/view_component/simple_user_list_view.dart';
import 'package:testing/features/user_summary/presenter/user_summary_bloc.dart';

abstract class ClickableCell {
  void didTapCell(BuildContext context, dynamic object);
}

class StreamBuilderForSimpleUserList implements SelectableItem {
  ClickableCell _clickableCell;

  StreamBuilderForSimpleUserList({ClickableCell clickableCell})
      : _clickableCell = clickableCell;

  Widget generateStreamBuilder(UserSummaryBlocable userSummaryBloc) {
    return StreamBuilder<List<User>>(
        stream: userSummaryBloc.obtainAllUse,
        builder: (BuildContext context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
            case ConnectionState.active:
              SimpleUserListView simpleUserListView =
                  SimpleUserListView(tappedCell: this);
              return simpleUserListView.buildListView(snapshot.data);
              break;
            case ConnectionState.waiting:
              return PlaceholderCenterView.clearListPlaceholderCenter(
                  'Aguarde...');
              break;
            default:
              return PlaceholderCenterView.clearListPlaceholderCenter(
                  'Algum erro...');
          }
        });
  }

  @override
  void selectedItem(BuildContext context, dynamic object) {
    _clickableCell.didTapCell(context, object);
  }
}
