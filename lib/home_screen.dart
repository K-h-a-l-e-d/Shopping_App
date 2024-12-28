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
              color: const Color.fromARGB(255, 16, 53, 83))
              ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade200,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Our Products',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Expanded(
          flex: 1,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productsList.length,
            itemBuilder: (context, index) {
              return Image.asset(productsList[index][1]);
            },
          ),
        ),
        Expanded(
          flex: 3,
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
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.5),
                        spreadRadius: 1,
                        blurRadius: 9,
                        offset: Offset(0, 1), // changes position of shadow
                      )
                    ],
                  ),
                  child: Column(
                    spacing: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "${productsList[index][1]}",
                        width: MediaQuery.of(context).size.width / 2,
                        height: 100,
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
              );
            },
          ),
        ),
        Text(
          'Hot Offers',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Expanded(
          flex: 1,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.5),
                        spreadRadius: 1,
                        blurRadius: 9,
                        offset: Offset(0, 1), // changes position of shadow
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset(
                          "${productsList[index][1]}",
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 10,
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
