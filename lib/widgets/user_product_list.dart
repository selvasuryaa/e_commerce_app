import 'package:flutter/material.dart';
import '../widgets/user_product_item.dart';
import '../helper/db_helper.dart';
// import 'package:meta/meta.dart';

// @immutable
// ignore: must_be_immutable
class UserProductList extends StatelessWidget {
  final Function deleteFunction;
  var db = DBHelper();
  
  UserProductList({
        required this.deleteFunction,

      });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        initialData: const [],
        future: db.getProducts(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data;
          var dataLength = data!.length;

          return dataLength == 0
              ? Center(
                  child: Text('No data found'),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dataLength,
                  itemBuilder: (ctx, index) {
                    return UserProductItem(
                      id: data[index].id,
                      title: data[index].title,
                      price: data[index].price,
                      deleteFunction: deleteFunction,
                      // insertFuntcion: insertFuntcion,
                    );
                  });
        });
  }
}
