import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carts'),
      ),
      drawer: AppDrawer(),
      body: Center(child: Text('CART SCREEN')),
    );
  }
}
