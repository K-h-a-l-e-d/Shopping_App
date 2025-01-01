import 'package:flutter/material.dart';
import '../utils/products_inventory.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _listScrollController = ScrollController();
  bool _listIsAtEnd = false;

  @override
  Widget build(BuildContext context) {
    return ListView(controller: _listScrollController, children: [
      Text(
        'Our Products',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
        height: MediaQuery.of(context).size.height * 0.63,
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
                      offset: Offset(0, 1), // changes position of shadow
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
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {},
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
        child: Row(
          spacing:
              MediaQuery.of(context).size.width / 4 - 'Hot Offers'.length + 2,
          children: [
            Text(
              'Hot Offers',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Icon(
              _listIsAtEnd
                  ? Icons.keyboard_arrow_down
                  : Icons.keyboard_arrow_up,
            )
          ],
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
        _listIsAtEnd = true;
      });
    } else {
      setState(() {
        _listIsAtEnd = false;
      });
    }
  }
}
