import 'package:flutter/material.dart';
import 'dart:math';

import '../screens/products_overview_screen.dart';

class GridList extends StatelessWidget {
  const GridList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return GridView.count(
        scrollDirection: Axis.vertical,
        // shrinkWrap: true,
        crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
        children: List.generate(50, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                print('COnt clicked');
                Navigator.of(context).pushNamed(
                  ProductsOverviewScreen.routeName,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                ),
                margin: EdgeInsets.all(5),
                alignment: Alignment.center,
                width: 177,
                height: 125,
                child: Text(
                  'Item $index',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
