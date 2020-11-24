import 'package:flutter/material.dart';
import 'package:testing/features/temporary_modules/temp_module_one.dart';
import 'package:testing/features/temporary_modules/temp_module_two.dart';
import 'package:testing/features/user_summary/router/user_summary_router.dart';

class BaseComponentPage extends StatefulWidget {
  final TargetPlatform platform;

  BaseComponentPage({this.platform});

  @override
  _BaseComponentPageState createState() => _BaseComponentPageState();
}

class _BaseComponentPageState extends State<BaseComponentPage> {
  int _currentPosition = 0;

  final List<Widget> _children = [
    UserSummaryRouter().createModule(),
    TempModuleOne(),
    TempModuleTwo()
  ];

  onTabTapped(int tabSelectedPosition) {
    setState(() {
      _currentPosition = tabSelectedPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Something'),
      ),
      body: _children[_currentPosition],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentPosition,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Tab 1'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.extension),
            title: Text('Tab 2'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            title: Text('Tab 3'),
          ),
        ],
      ),
    );
  }
}
