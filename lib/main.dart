import 'package:flutter/material.dart';
import 'package:shopping_app_ui/flags.dart';
import 'landing_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //listening for a change in isDarkThemeEnabled flag and toggling the app dark theme mode accordingly
    return ValueListenableBuilder(
      valueListenable: isDarkThemeEnabled,
      builder: (context, isDarkThemeEnabled, child) => MaterialApp(
        title: 'Shopping App',
        debugShowCheckedModeBanner: false,
        theme: isDarkThemeEnabled ? ThemeData.dark() : ThemeData.light(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: MyHomePage(),
      ),
    );
  }
}
