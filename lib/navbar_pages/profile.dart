import 'package:flutter/material.dart';
import 'package:shopping_app_ui/home_screen.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 20,
        children: [
          Image.asset(
            "assets/images/profile_pic.jpg",
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          isLoggedIn
              ? Text(
                  'Logged in as a Guest',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22),
                )
              : Text(
                  'UserName',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22),
                ),
        ],
      ),
    );
  }
}
