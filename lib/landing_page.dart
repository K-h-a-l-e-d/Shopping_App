import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_ui/drawer.dart';
import 'package:shopping_app_ui/flags.dart';
import 'package:shopping_app_ui/views/products_page.dart';
import 'package:shopping_app_ui/views/profile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPage = 0;

  List<Widget> pages = [Home(), Profile()];

  void toggleDarkTheme() {
    isDarkThemeEnabled.value = !isDarkThemeEnabled.value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
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
        onTap: selectClickedPageIconIndex,
        items: [
          BottomNavigationBarItem(
              label: tr('home'),
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: tr('profile'),
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person)),
        ],
      ),
    );
  }

  Future<void> selectClickedPageIconIndex(int index) async {
    selectedPage = index;

    setState(() {});
  }
}
