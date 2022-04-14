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
  List<Placeholderss> listData = [];

  Future<List<Placeholderss>> fetchPlaceholder() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/'));

    var jsondata = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (Map i in jsondata) {
        listData.add(Placeholderss.fromJson(i));
      }
      return listData;
    } else {
      return listData;
      // throw Exception('Failed to load data');
    }
    // var datas = Placeholderss(
    //   id: jsondata['id'],
    //   completed: jsondata['completed'],
    //   title: jsondata['title'],
    //   userId: jsondata['userId'],
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carts'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder<List<Placeholderss>>(
          future: fetchPlaceholder(),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (ctx, i) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(listData[i].title),
                        subtitle: Text(
                          listData[i].completed.toString(),
                        ),
                        leading: CircleAvatar(
                          child: Text(
                            listData[i].id.toString(),
                          ),
                        ),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: listData.length,
              );
            } else if (snapshot.hasError) {
              return Text('Failed to load ${snapshot.error}');
            } else {
              return Center(
                child: const CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
