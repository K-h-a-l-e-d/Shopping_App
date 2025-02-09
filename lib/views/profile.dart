import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_ui/flags.dart';
import 'package:shopping_app_ui/services/local_auth_api.dart';
import 'package:shopping_app_ui/views/authentication/login_page.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isBioAuthed = false;

  //calling this function pops up device's biometric authentication interface requesting
  //user to either Scan fingerprint to Face ID and returns true in case of succesfull authentication
  bioAuthenticate() async {
    isBioAuthed = await LocalAuthApi.authenticate();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    //calling the bio authentication function once this page is built and if user is logged in
    if (isLoggedIn.value) {
      bioAuthenticate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isLoggedIn,
      builder: (context, loggedIn, child) {
        return !loggedIn // checking if User is logged in
            ? LoginPage()
            : isBioAuthed // checking if user has successfully BioAuthenticated
                ? SingleChildScrollView(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 20,
                      children: [
                        Icon(
                          Icons.person,
                          size: MediaQuery.of(context).size.width / 2,
                        ),
                        Text(
                          FirebaseAuth.instance.currentUser!.displayName!,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22),
                        )
                      ],
                    ),
                  )
                : Center(child: Text('Scan Fingerprint to view Profile'));
      },
    );
  }
}
