import 'package:flutter/material.dart';
import 'dart:math';

import '../screens/product_detail_screen.dart';

class ProductsOverviewScreen extends StatelessWidget {
  static const routeName = '/overview screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 248, 4, 4),
                Color.fromARGB(255, 12, 12, 12),
                // Color.fromARGB(255, 179, 197, 18),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
        ),
        title: Text('PRODUCTS'),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return GridView.count(
          scrollDirection: Axis.vertical,
          // shrinkWrap: true,
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          children: List.generate(50, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  print('${index}nd COntainer clicked');

                  Navigator.of(context).pushNamed(
                    ProductDetailScreen.routeName,
                    arguments: index,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    width: 2,
                    color: Colors.black,
                  ),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.primaries[Random().nextInt(
                      Colors.primaries.length,
                    )],
                  ),
                  margin: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  width: 100,
                  height: 100,
                  child: Text(
                    'Item $index',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          }),
        );
      }),
    );
  }
}
