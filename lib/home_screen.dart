import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_ui/navbar_pages/authentication/login_page.dart';
import 'package:shopping_app_ui/navbar_pages/products_page.dart';
import 'package:shopping_app_ui/navbar_pages/profile.dart';
import 'package:shopping_app_ui/utils/helper_functions.dart';

bool isLoggedIn = false;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPage = 0;

  List<Widget> pages = [Home(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ListTile(
                title: Text(tr('change_language')),
                trailing: Icon(Icons.language),
                onTap: () {
                  context.locale == Locale('en', 'US')
                      ? context.setLocale(Locale('ar', 'EG'))
                      : context.setLocale(Locale('en', 'US'));
                }),
            isLoggedIn
                ? ListTile(
                    title: Text(tr('log_out')),
                    trailing: Icon(Icons.logout),
                    onTap: () {
                      isLoggedIn = false;
                      navigateTo(context, LoginPage());
                      setState(() {});
                    },
                  )
                : ListTile(
                    title: Text(tr('log_in')),
                    trailing: Icon(Icons.login),
                    onTap: () => navigateTo(context, LoginPage()),
                  ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(tr('appBar_title'),
            style: TextStyle(
                fontFamily: 'Playfair Display',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 16, 53, 83))),
        centerTitle: true,
        backgroundColor: Colors.blue.withValues(alpha: 0.5),
      ),
      body: pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        onTap: navigateToSelectedPage,
        items: [
          BottomNavigationBarItem(label: tr('home'), icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: tr('profile'), icon: Icon(Icons.person)),
        ],
      ),
    );
  }

  void navigateToSelectedPage(int index) {
    selectedPage = index;
    setState(() {});
  }
}
