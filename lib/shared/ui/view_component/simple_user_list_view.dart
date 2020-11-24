import 'package:flutter/material.dart';
import 'package:testing/shared/model/user.dart';
import 'package:testing/shared/ui/view_component/placeholder_center_view.dart';

abstract class SelectableItem {
  void selectedItem(BuildContext context, dynamic object);
}

abstract class SimpleUserListViewable {
  Widget buildListView(List<User> data);
  SelectableItem tappedCell;
}

class SimpleUserListView implements SimpleUserListViewable {
  @override
  SelectableItem tappedCell;

  SimpleUserListView({Key key, @required this.tappedCell});

  @override
  Widget buildListView(List<User> data) {
    if (data.length > 0) {
      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          User user = data[index];
          return ListTile(
            key: Key('item_${index}_name'),
            title: Text('${user.name}'),
            subtitle: Text('${user.email}'),
            onTap: () => tappedCell.selectedItem(context, user),
          );
        },
      );
    }
    return PlaceholderCenterView.clearListPlaceholderCenter("Erro na lista...");
  }
}
