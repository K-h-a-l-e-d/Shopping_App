import 'package:firebase_auth/firebase_auth.dart';
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
          Icon(
            Icons.person,
            size: MediaQuery.of(context).size.width / 2,
          ),
          isLoggedIn
              ? Text(
                  FirebaseAuth.instance.currentUser!.displayName!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22),
                )
              : Text(
                  'Logged in as a Guest',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22),
                ),
        ],
      ),
    );
  }
}
