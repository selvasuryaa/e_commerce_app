import 'package:flutter/material.dart';
// import '../helper/db_helper.dart';
import '../models/product.dart';

class UserInput extends StatelessWidget {
  final Function insertFunction;
  // final Function deleteFunction;
  UserInput(
      {required this.insertFunction,
      //  required this.deleteFunction,
      Key? key})
      : super(key: key);

  // var db = DBHelper();

  final _titleController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        decoration: InputDecoration(labelText: 'Title'),
        controller: _titleController,
      ),
      // SizedBox(
      //   height: 10,
      // ),
      TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'Price'),
        controller: _priceController,
      ),
      Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(10),
                padding: MaterialStateProperty.all(EdgeInsets.all(17)),
                backgroundColor: MaterialStateProperty.all(Colors.amber),
              ),
              child: Text(
                'Add Poduct',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                var myProduct = Product(
                  title: _titleController.text,
                  price: int.parse(_priceController.text),
                );
                insertFunction(myProduct);
                FocusScope.of(context).unfocus();
              
                // Navigator.of(context).pop();
              },
              // FocusScope.of(context).unfocus();
            )
          ]))
    ]);
  }
}
