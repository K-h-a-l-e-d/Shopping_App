import 'package:flutter/material.dart';
import 'products_data.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView(children: [
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
          height: MediaQuery.of(context).size.height * 0.68,
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
                        Icon(Icons.add_shopping_cart)
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Text(
          'Hot Offers',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}
