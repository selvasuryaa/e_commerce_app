import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/carousel.dart';
import '../widgets/search_bar.dart';
import '../widgets/grid_list.dart';
import '../screens/cart_screen.dart';

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
              Navigator.of(context).pushNamed(CartScreen.routeName);
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 10,
            ),
            Carousel(),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 900,
              child: GridList(),
            ),
          ],
        ),
      ),
    );
  }
}
