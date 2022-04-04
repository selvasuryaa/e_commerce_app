import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/carousel.dart';
import '../widgets/app_drawer.dart';
import '../widgets/carousel.dart';
import '../widgets/search_bar.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/categories';

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
        ))),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Shopping App'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: Search());
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print('clicked');
            },
            icon: Icon(
              Icons.shopping_cart_checkout_sharp,
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              child: Carousel(),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
