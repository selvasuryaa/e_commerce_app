// import 'package:flutter/material.dart';

class Product {
    int? id;
  final String title;
  final num price;

  Product({ this.id, required this.title, required this.price});
 

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'title' : title,
      'price' : price,
    };
  }

  // for debugging
@override
String toString(){
  return 'Product (id : $id, title: $title, price: $price)';
}

}


