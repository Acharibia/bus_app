import 'package:bus_app/screens/drawer_content/notification/notification.dart';
import 'package:bus_app/screens/drawer_content/settings_page.dart';
import 'package:bus_app/screens/home/home_screen.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';

import '../drawer_content/account/account_page.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int selectedPos = 0;
  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
    new TabItem(
      Icons.home,
      "Home",
      Colors.blue.shade200,
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
    new TabItem(
      Icons.settings,
      "Settings",
      Colors.black54,
      labelStyle: TextStyle(fontWeight: FontWeight.bold,),
    ),
    new TabItem(
      Icons.person,
      "Account",
      Colors.red,
    ),
    new TabItem(
      Icons.notifications,
      "Notification",
      Colors.cyan,
    )
  ]);
  late CircularBottomNavigationController _navigationController;
  @override
  void initState() {
    super.initState();
    _navigationController = new CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            child: bodyContainer(),
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget bodyContainer() {
    Color? selectedColor = tabItems[selectedPos].circleColor;
    Widget widget;
    switch (selectedPos) {
      case 0:
        widget = HomeScreen();
        break;
      case 1:
        widget = SettingsPage();
        break;
      case 2:
        widget = AccountPage();
        break;
      case 3:
        widget = NotificationPage();
        break;
      default:
        widget = HomeScreen();
        break;
    }
    return GestureDetector(
      child:Container(
        color: selectedColor,
        child: widget,),
      onTap: () {
        if (_navigationController.value == tabItems.length - 1) {
          _navigationController.value = 0;
        } else {
          _navigationController.value = _navigationController.value! + 1;
        }
      },
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      selectedPos: selectedPos,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,
      backgroundBoxShadow: <BoxShadow>[
        BoxShadow(color: Colors.black45, blurRadius: 10.0),
      ],
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
          print(_navigationController.value);
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
