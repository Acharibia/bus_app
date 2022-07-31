import 'package:bus_app/components/drawer_custom_widget.dart';
import 'package:bus_app/components/drawer_list_view.dart';
import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
        title: Text("Event Page",
      ),
      centerTitle: true,
      ),
        drawer:DrawerCustomWidget());
  }
}