import 'package:flutter/material.dart';
import '../widgets/user_input.dart';

import '../helper/db_helper.dart';
import '../widgets/app_drawer.dart';
import '../widgets/user_product_list.dart';
import '../models/product.dart';

class UserProductScreen extends StatefulWidget {
  static const routeName = '/user-products';

  const UserProductScreen({Key? key}) : super(key: key);

  @override
  State<UserProductScreen> createState() => _UserProductScreenState();
}

class _UserProductScreenState extends State<UserProductScreen> {
  var db = DBHelper();

  void _saveProduct(Product product) async {
    await db.insertProduct(product);
    setState(() {});
  }

  void _deleteProduct(Product prod) async {
    await db.deleteProduct(prod);
    setState(() {});
  }

  // var anotherProduct = Product(id: )

  // print(_titleController.text);
  // print(_priceController.text);
  //   setState(() {});
  // }

  //   final newProduct = Product(
  //     id: DateTime.now().toString(),
  //     // id: Random().nextInt(16),
  //     title: _titleController.text,
  //     price: _priceController.text,
  //   );
  //   print(newProduct.id);
  //   // print(runtimeType(newProduct.id));
  //   _items.add(newProduct);
  //   DBHelper.insertProduct('userProducts', {
  //     'id': newProduct.id,
  //     'title': newProduct.title,
  //     'price': newProduct.price,
  //   });
  //   _titleController.text = '';
  //   _priceController.text = '';
  //   // Navigator.of(context).pop();
  // }

  // Future<List<Map<String, Object>>> _fetchProduct() async {
  //   final dataList = await DBHelper.getdata('user_products');

  //   _items = dataList.map((item) {
  //     return Product(
  //       id: item['id'],
  //       title: item['title'],
  //       price: item['price'],
  //     );
  //   }).toList();
  //   print(dataList);
  //   throw _items;
  // }

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
            ),
          ),
        ),
        title: Text('User Products'),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                height: 250,
                child: UserInput(
                  insertFunction: _saveProduct,
                  //  deleteFunction: _deleteProduct
                ),
              ),
              UserProductList(
                // inserFuntcion: _saveProduct,
               deleteFunction: _deleteProduct,
               ),
              // deleteFn: _deleteProduct,
              //  inserFuntcion: _saveProduct,
            ],
          ),
        ),
      ),
    );
  }
}
