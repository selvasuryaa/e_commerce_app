// import 'package:flutter/material.dart';
// import '../models/product.dart';
// import '../widgets/app_drawer.dart';
// import '../helper/db_helper.dart';

// class CartScreen extends StatefulWidget {
//   static const routeName = '/cart';

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   List<Product> _items = [];
//   var future;


//   Future<List<Map<String, Object>>>  _fetchProduct() async {
//     final dataList = await DBHelper.getdata('user_products');

//     print(dataList);
//     _items = dataList.map((item) {
//       return Product(
//         id: item['id'],
//         title: item['title'],
//         price: item['price'],
//       );
//     }).toList();
//     throw _items;
//   }
//   @override
//   void initState() {
//     future = _fetchProduct();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Carts'),
//       ),
//       drawer: AppDrawer(),
//       body: FutureBuilder(
//           // initialData: const [],
//           future: future,
//           builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) {
//             // var data = snapshot.data;
//             // var dataLength = data!.length;

//              if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Center(child: CircularProgressIndicator());
//                     } else if (snapshot.connectionState ==
//                         ConnectionState.done) {
//                       return ListView.builder(
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         itemBuilder: (ctx, i) {
//                           return ListTile(
//                             title: Text(_items[i].title),
//                           );
//                         },
//                         itemCount: _items.length,
//                       );
//                     } else {
//                       return Center(
//                         child: const Text(
//                             'Got no proucts yet, start adding some!'),
//                       );
//                     }
//           }),
//     );
//   }
// }
