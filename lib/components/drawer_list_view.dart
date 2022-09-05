import 'package:bus_app/screens/drawer_content/account_page.dart';
import 'package:bus_app/screens/drawer_content/contacts_page.dart';
import 'package:bus_app/screens/drawer_content/events_page.dart';
import 'package:bus_app/screens/drawer_content/help_page.dart';
import 'package:bus_app/screens/drawer_content/notification/notification.dart';
import 'package:bus_app/screens/drawer_content/privacy_policy_page.dart';
import 'package:bus_app/screens/drawer_content/send_feedback_page.dart';
import 'package:bus_app/screens/drawer_content/settings_page.dart';
import 'package:bus_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class MyDrawerList extends StatefulWidget {
  const MyDrawerList({Key? key}) : super(key: key);

  @override
  State<MyDrawerList> createState() => _MyDrawerListState();
}

class _MyDrawerListState extends State<MyDrawerList> {
  var currentPage = DrawerSections.account;
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.account) {
      container = AccountPage();
    } else if (currentPage == DrawerSections.contacts) {
      container = ContactPage();
    } else if (currentPage == DrawerSections.events) {
      container = EventPage();
    } else if (currentPage == DrawerSections.help) {
      container = HelpPage();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    } else if (currentPage == DrawerSections.notifications) {
      container = NotificationPage();
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = PrivacyPolicyPage();
    } else if (currentPage == DrawerSections.send_feedback) {
      container = FeedbackPage();
    }

    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItems(1, "My account", Icons.person_outline,
              currentPage == DrawerSections.account ? true : false),
          menuItems(2, "Contacts", Icons.people_alt_outlined,
              currentPage == DrawerSections.contacts ? true : false),
          menuItems(3, "Events", Icons.event,
              currentPage == DrawerSections.events ? true : false),
          menuItems(4, "Help", Icons.help,
              currentPage == DrawerSections.help ? true : false),
          Divider(),
          menuItems(5, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItems(6, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          Divider(),
          menuItems(7, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItems(8, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
        ],
      ),
    );
  }

  Widget menuItems(int id, String title, IconData icon, bool selected) {
    return Material(
        // color: selected ? Colors.grey.shade300 : Colors.transparent,
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            setState(() {
              if (id == 1) {
                // setState(() {
                  currentPage = DrawerSections.account;
                // });
                // currentPage = DrawerSections.account;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AccountPage()));
              }
              if (id == 2) {
                // currentPage = DrawerSections.contacts;
                // setState(() {
                  currentPage = DrawerSections.contacts;
                // });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ContactPage()));
              }
              if (id == 3) {
                // currentPage = DrawerSections.events;
                // setState(() {
                  currentPage = DrawerSections.events;
                // });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => EventPage()));
              }
              if (id == 4) {
                // currentPage = DrawerSections.help;
                // setState(() {
                  currentPage = DrawerSections.help;
                // });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HelpPage()));
              }
              if (id == 5) {
                // currentPage = DrawerSections.settings;
                // setState(() {
                  currentPage = DrawerSections.settings;
                // });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SettingsPage()));
              }
              if (id == 6) {
                // currentPage = DrawerSections.notifications;
                // setState(() {
                  currentPage = DrawerSections.notifications;
                // });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => NotificationPage()));
              }
              if (id == 7) {
                // currentPage = DrawerSections.privacy_policy;
                // setState(() {
                  currentPage = DrawerSections.privacy_policy;
                // });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            PrivacyPolicyPage()));
              }
              if (id == 8) {
                // currentPage = DrawerSections.send_feedback;
                // setState(() {
                  currentPage = DrawerSections.send_feedback;
                // });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => FeedbackPage()));
              }
            });
          },
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: Icon(
                    icon,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
