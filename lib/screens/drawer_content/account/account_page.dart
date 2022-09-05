
import 'package:bus_app/screens/drawer_content/account/profile_page.dart';
import 'package:flutter/material.dart';
class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);
  static final String title = 'User Profile';

  @override
  Widget build(BuildContext context) {
    return ProfilePage();

  }
}