import 'package:flutter/material.dart';
import 'dart:math';

import '../screens/product_detail_screen.dart';

class ProductsOverviewScreen extends StatelessWidget {
  static const routeName = '/overview screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
