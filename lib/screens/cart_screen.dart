import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../models/placeholder.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
 Future<Placeholderss> fetchPlaceholder() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/77'));

    var jsondata = jsonDecode(response.body);
    var data = Placeholderss(
      id: jsondata['id'],
      completed: jsondata['completed'],
      title: jsondata['title'],
      userId: jsondata['userId'],
    );

    return data;
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carts'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder<Placeholderss>(
          future: fetchPlaceholder(),
          builder: (ctx, snapshot) {
         
            if (snapshot.hasData) {
              return Card(
                elevation: 10,
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Title: ${snapshot.data!.title}',
                          ),
                          Text(
                            'Id : ${snapshot.data!.id.toString()}',
                          ),
                          Text(
                            'User ID :${snapshot.data!.userId.toString()}',
                          ),
                          Text(
                            'Completed : ${snapshot.data!.completed.toString()}',
                          )
                        ]),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Failed to load ${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
