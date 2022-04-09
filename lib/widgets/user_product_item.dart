import 'package:flutter/material.dart';
import '../models/product.dart';

class UserProductItem extends StatefulWidget {
  final int id;
  final String title;
  final int price;
  final Function deleteFunction;
  // final Function insertFunction;

  const UserProductItem(
      {required this.id,
      required this.title,
      required this.price,
      required this.deleteFunction,
      // required this.insertFunction,

      Key? key})
      : super(key: key);

  @override
  State<UserProductItem> createState() => _UserProductItemState();
}

class _UserProductItemState extends State<UserProductItem> {
  @override
  Widget build(BuildContext context) {
    var anotherProduct = Product(
      title: widget.title,
      price: widget.price,
      id: widget.id,
    );
    final scaffold = ScaffoldMessenger.of(context);
    return Card(
      child: Row(
          // mainAxisAlignment:MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.id.toString(),
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      widget.title,
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(widget.price.toString()),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () async {
                  try {
                    // setState(() {
                     widget.deleteFunction(anotherProduct);
                      
                    // });
                    scaffold.showSnackBar(SnackBar(content: Text('${widget.title.toUpperCase()}  deleted')));
                  } catch (err) {
                    print(err);
                    throw err;
                  }
                },

                // Navigator.of(context).pop();
                // print('object');

                icon: Icon(
                  Icons.clear,
                ),
              ),
            ),
          ]),
    );
  }
}
