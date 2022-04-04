import 'package:flutter/material.dart';
import './screens/categories_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      theme: ThemeData(
        primaryColor: Colors.purple,
        // canvasColor: Colors.black54,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color.fromARGB(255, 215, 184, 91),
        ),
        fontFamily: 'Lato',
        textTheme: ThemeData.light().textTheme.copyWith(
           headline1: TextStyle(
              fontFamily: 'Lato-Bold',
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
             headline6: TextStyle(
              // fontFamily: 'Lato-Bold',
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
        )
      ),
      home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
        ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
        ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
      },
    );
  }
}
