import 'package:flutter/material.dart';
import 'package:shopping_app_ui/navbar_pages/authentication/login_page.dart';
import 'package:shopping_app_ui/navbar_pages/products_page.dart';
import 'package:shopping_app_ui/navbar_pages/profile.dart';

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
            isLoggedIn
                ? ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        )),
                    title: Text('Log out'),
                    trailing: Icon(Icons.logout),
                  )
                : ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        )),
                    title: Text('Log in'),
                    trailing: Icon(Icons.login),
                  ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Electronics Stores",
            style: TextStyle(
                fontFamily: 'Playfair Display',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 16, 53, 83))),
        centerTitle: true,
        backgroundColor: Colors.blue.shade200,
      ),
      body: pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPage,
          onTap: navigateToSelectedPage,
          items: [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
          ]),
    );
  }

  void navigateToSelectedPage(int index) {
    selectedPage = index;
    setState(() {});
  }
}
