import 'package:flutter/material.dart';
// import '../helper/db_helper.dart';
import '../models/product.dart';

class UserInput extends StatefulWidget {
  final Function insertFunction;
  // final Function deleteFunction;
  UserInput(
      {required this.insertFunction,
      //  required this.deleteFunction,
      Key? key})
      : super(key: key);

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  final _titleController = TextEditingController();

  final _priceController = TextEditingController();
  // final _titleFocusNode = FocusNode();
  // final _priceFocusNode = FocusNode();

  var initialValues = {
    'title': '',
    'price': '',
  };

  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    return Column(children: [
      TextFormField(
        // focusNode: _titleFocusNode,
        // onFieldSubmitted: (valu){
        //   FocusScope.of(context).requestFocus(_priceFocusNode);
        // },

        // initialValue: initialValues['title'],
        decoration: InputDecoration(labelText: 'Title'),
        controller: _titleController,
        textInputAction: TextInputAction.next,
      ),
      // SizedBox(
      //   height: 10,
      // ),
      TextFormField(
        // focusNode: FocusScope.of(context).
        // focusNode: _priceFocusNode,
        // initialValue: initialValues['price'],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'Price'),
        controller: _priceController,
        textInputAction: TextInputAction.done,
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
                try {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    currentFocus.focusedChild?.unfocus();
                  }

                  var myProduct = Product(
                    title: _titleController.text,
                    price: int.parse(_priceController.text),
                  );
                  widget.insertFunction(myProduct);
                  _titleController.text = '';
                  _priceController.text = '';

                  scaffold.showSnackBar(SnackBar(
                      duration: Duration(seconds: 1),
                      content:
                          Text('${myProduct.title.toUpperCase()}  Added')));
                } catch (error) {
                  print(error);
                  throw error;
                }

                // Navigator.of(context).pop();
              },
              // FocusScope.of(context).unfocus();
            )
          ]))
    ]);
  }
}
