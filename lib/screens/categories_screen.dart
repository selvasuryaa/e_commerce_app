import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
// import 'package:carousel_pro/carousel_pro.dart';

class CategoriesScreen extends StatelessWidget {

static const routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Shopping App'),
          actions: [
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
        body: null
        // Column(children: [
        //   Carousel(images: [
        //     Image.asset('download.jpg')
        //   ],)
        // ],)
      );
    
  }
}