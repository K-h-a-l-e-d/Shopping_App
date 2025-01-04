import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_ui/home_screen.dart';
import '../utils/helper_functions.dart';
import '../utils/products_inventory.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _listScrollController = ScrollController();
  bool _isListAtEnd = false;

  @override
  Widget build(BuildContext context) {
    return ListView(controller: _listScrollController, children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.1, horizontal: 10),
        child: Text(
          tr('products_title'),
          style: TextStyle(
              fontFamily: 'Playfair Display',
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.12,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productsList.length,
          itemBuilder: (context, index) {
            return Image.asset(productsList[index][1]);
          },
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height *
            (context.locale == Locale('en', 'US') ? 0.63 : 0.61),
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: productsList
              .length, //Builds a Grid based on the No. of products in stock
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.5),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 1),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    spacing: 3,
                    children: [
                      Expanded(
                        child: Image.asset(
                          "${productsList[index][1]}",
                        ),
                      ),
                      Text(
                        '${productsList[index][0]}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),
                      ),
                      IconButton(
                        onPressed: () => isLoggedIn
                            ? snackBarMsg(context, msg: 'Item added to Cart')
                            : snackBarMsg(context, msg: 'You must login First'),
                        icon: Icon(Icons.shopping_cart_checkout),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      Container(
        color: Colors.blue.withValues(alpha: 0.4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  tr('hot_offers_title'),
                  style: TextStyle(
                      height: 1,
                      fontFamily: 'Playfair Display',
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Icon(
                _isListAtEnd
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_up,
              ),
              Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.23,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productsList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: Offset(0, 1),
                      color: Colors.black.withValues(alpha: 0.5),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        productsList[index][1],
                      ),
                    ),
                    Text(
                      '50% off Sale',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ]);
  }

  @override
  void initState() {
    super.initState();
    _listScrollController.addListener(_listScrollListener);
  }

  @override
  void dispose() {
    _listScrollController.dispose();
    super.dispose();
  }

  void _listScrollListener() {
    if (_listScrollController.position.pixels ==
        _listScrollController.position.maxScrollExtent) {
      setState(() {
        _isListAtEnd = true;
      });
    } else {
      setState(() {
        _isListAtEnd = false;
      });
    }
  }
}
