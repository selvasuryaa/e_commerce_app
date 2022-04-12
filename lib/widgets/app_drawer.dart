import 'package:flutter/material.dart';
import '../screens/user_product_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/categories_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(children: [
          Container(
            alignment: Alignment.center,
            height: 100,
            width: double.infinity,
            color: Colors.purple,
            child: Text(
              'Browse Amazon',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.border_all_outlined,
            ),
            title: Text('All Products'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(CategoriesScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.bookmark_added),
            title: Text('Favourites'),
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_cart_rounded,
            ),
            title: Text('Cart'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(CartScreen.routeName);
            },
            hoverColor: Theme.of(context).colorScheme.secondary,
          ),
          ListTile(
            leading: Icon(
              Icons.business_center_sharp,
            ),
            title: Text('Orders'),
          ),
           ListTile(
            
            leading: Icon(
              Icons.person
            ),
            title: Text('User Products'),
              onTap: () {
              Navigator.of(context).pushReplacementNamed(UserProductScreen.routeName);
            },
          ),
        ]),
      ),
    );
  }
}
