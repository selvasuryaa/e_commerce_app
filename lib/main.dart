import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import './screens/categories_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/user_product_screen.dart';
import './screens/cart_screen.dart';


void main()  {
  // WidgetsFlutterBinding.ensureInitialized();
  // var db = DBHelper();
  // // await db.insertProduct(Product(id: 2, title: 'dress', price: 555));

  //  print(await db.getProducts());

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
          // canvasColor: Colors.white70,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Color.fromARGB(255, 215, 184, 91),
          ),
          fontFamily: 'Lato',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline1: TextStyle(
                  fontFamily: 'Lato-Bold',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
                headline6: TextStyle(
                  color: Colors.grey,
                  // fontFamily: 'Lato-Bold',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              )),
      home: AnimatedSplashScreen(
          duration: 1000,
          splash: Icons.flutter_dash,
          splashIconSize: 100,
          nextScreen: CategoriesScreen(),
          splashTransition: SplashTransition.rotationTransition,
          // pageTransitionType: PageTransitionType.scale,
          backgroundColor: Colors.blue),
      initialRoute: '/',
      routes: {
        CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
        ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
        ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        CartScreen.routeName: (ctx) => CartScreen(),
        UserProductScreen.routeName: (ctx) => UserProductScreen(),
      },
    );
  }
}
