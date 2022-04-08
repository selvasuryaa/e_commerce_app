import 'package:flutter/material.dart';
import '../screens/products_overview_screen.dart';
import 'dart:math';

class ProductItem extends StatelessWidget {
  final int index;

  ProductItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
          onTap: () {
            print('Container clicked');
            Navigator.of(context).pushNamed(
              ProductsOverviewScreen.routeName,
            );
          },
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Column(children: [
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)]),
                        width: 200,
                        height: 200,
                        child: Center(
                          child: Text(
                            'Product $index',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      right: 15,
                      child: Icon(Icons.star_border),
                    ),
                  ],
                ),
              ),
              Text(
                'New Collection',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Min 70% off',
                style: TextStyle(color: Colors.green),
              ),
              Text(
                ' Start from\u{20B9} 3,999',
                // style: TextStyle(color: Colors.green),
              ),
            ]),
          )),
    );
  }
}
