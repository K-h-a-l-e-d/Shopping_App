import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_ui/flags.dart';
import 'package:shopping_app_ui/utils/helper_functions.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  void toggleDarkTheme() {
    isDarkThemeEnabled.value = !isDarkThemeEnabled.value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      children: [
        ListTile(
            title: Text(tr('change_language')),
            trailing: Icon(Icons.language),
            onTap: () {
              context.locale == Locale('en', 'US')
                  ? context.setLocale(Locale('ar', 'EG'))
                  : context.setLocale(Locale('en', 'US'));
            }),
        SwitchListTile(
          controlAffinity: ListTileControlAffinity.platform,
          title: Text('Dark Mode'),
          value: isDarkThemeEnabled.value,
          //calling toggle dark theme function when switch is pressed
          onChanged: (value) => toggleDarkTheme(),
        ),
        //depending on logged in flag status the Log in/out widget is displayed
        isLoggedIn.value
            ? ListTile(
                title: Text(tr('log_out')),
                trailing: Icon(Icons.logout),
                onTap: () {
                  isLoggedIn.value = false;
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                  snackBarMsg(context, msg: 'User Logged Out');
                  setState(() {});
                },
              )
            : Container(),
      ],
    );
  }
}
