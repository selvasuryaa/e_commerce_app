import 'package:flutter/material.dart';
import 'dart:math';

import '../screens/products_overview_screen.dart';

class GridList extends StatefulWidget {
  final int listCount;

  GridList(this.listCount);

  @override
  State<GridList> createState() => _GridListState();
}

class _GridListState extends State<GridList> {
  var isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return GridView.count(
        // mainAxisSpacing: 5,
        // crossAxisSpacing: 5,
        // childAspectRatio: 1.5,
        scrollDirection: Axis.vertical,
        // shrinkWrap: true,
        crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
        children: List.generate(widget.listCount, (index) {
          return
              // padding: const EdgeInsets.all(8.0),
              Padding(
            padding: const EdgeInsets.all(6.0),
            child: InkWell(
                onTap: () {
                  print('COnt clicked');
                  Navigator.of(context).pushNamed(
                    ProductsOverviewScreen.routeName,
                  );
                },
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: Column(children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.primaries[
                                    Random().nextInt(Colors.primaries.length)]),
                            width: 300,
                            height: 200,
                            child: Center(
                              child: Text(
                                'Product ${index}',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 6,
                            child: IconButton(
                              icon: isFavourite
                                  ? Icon(Icons.star)
                                  : Icon(Icons.star_border),
                              onPressed: () {
                                isFavourite = !isFavourite;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text('New Collection'),
                    Text(
                      'Min 70% off',
                      style: TextStyle(color: Colors.green),
                    ),
                  ]),
                )
                //  Container(
                //   decoration: BoxDecoration(
                //     border: Border.all(
                //       width: 2,
                //       color: Colors.black,
                //     ),
                //     borderRadius: BorderRadius.circular(10),
                //     color: Colors
                //         .primaries[Random().nextInt(Colors.primaries.length)],
                //   ),
                //   // margin: EdgeInsets.all(2),
                //   alignment: Alignment.center,
                //   width: 0,
                //   height: 0,
                //   child: Text(
                //     'Item $index',
                //     style: Theme.of(context).textTheme.headline1,
                //     textAlign: TextAlign.center,
                //   ),
                // ),
                ),
          );
        }),
      );
    });
  }
}
