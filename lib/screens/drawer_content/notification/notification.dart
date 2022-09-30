import 'package:bus_app/components/drawer_custom_widget.dart';
import 'package:bus_app/components/drawer_list_view.dart';
import 'package:bus_app/constants.dart';
import 'package:flutter/material.dart';

import '../../home/home_screen.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Notification",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                  (route) => false); //
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black54,
          ),
        ),
      ),
      body: ListView.separated(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 12,
        itemBuilder: (context, index) {
          return NotificationTiles(
            title: 'Bus app',
            subtitle: 'Thanks for download Bus app.',
            enable: true,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => NotificationView(),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}

class NotificationTiles extends StatelessWidget {
  final String title, subtitle;
  final Function() onTap;
  final bool enable;
  const NotificationTiles({
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.enable,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/notify.png'),
              fit: BoxFit.cover),
        ),
      ),
      title: Text(title, style: TextStyle(color: kDarkColor)),
      subtitle: Text(subtitle, style: TextStyle(color: kLightColor)),
      onTap: onTap,
      enabled: enable,
    );
  }
}

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Message"),
      ),
      // color : Colors.white,
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      // margin: EdgeInsets.all(kFixPadding),
      // padding: EdgeInsets.all(kFixPadding),
      // decoration: BoxDecoration(
      // color: kWhiteColor,
      // shape: BoxShape.rectangle,
      // borderRadius: BorderRadius.circular(8.0),
      // boxShadow: [BoxShadow(color: kLightColor, blurRadius: 2.0)]),
      // child: Column(
      //   children: [
      //     Text(
      //         'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      //         style: kDarkTextStyle),
      //     // SizedBox(height: 16.0),
      //     Image(image: AssetImage("assets/images/logo.png")),
      //     // SizedBox(height: 16.0),
      //     Text(
      //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
      //         style: TextStyle(color: kLightColor)),
      //     // SizedBox(height: 16.0),
      //     Align(
      //       alignment: Alignment.centerRight,
      //       child: Text('11/Feb/2021 04:42 PM',
      //           style: TextStyle(color: kLightColor)),
      //     )
      //   ],
      // ),
    );
  }
}
