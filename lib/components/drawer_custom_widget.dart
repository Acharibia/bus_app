import 'package:bus_app/components/drawer_list_view.dart';
import 'package:bus_app/components/my_drawer_header.dart';
import 'package:flutter/material.dart';

class DrawerCustomWidget extends StatelessWidget {
  const DrawerCustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              MyHeaderDrawer(),
              MyDrawerList(),
            ],
          ),
        ),
      ),
    );
  }
}
