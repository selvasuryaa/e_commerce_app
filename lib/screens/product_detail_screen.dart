import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/detail-screen';

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  var isFavourite = false;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    // print(runtimeType);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Item ${args}',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavourite ? Icons.star : Icons.star_border),
        onPressed: () {
          isFavourite = !isFavourite;
          print('jjj');
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(color: Colors.purple),
              child: Text(
                'Item ${args}',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'REDMI 10(Midnight Black, 64 GB) (4 GB RAM)',
                style: Theme.of(context).textTheme.headline1,
                softWrap: true,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Chip(
                    label: Row(
                      children: [
                        Text('4.5'),
                        Icon(
                          Icons.star,
                          size: 10,
                        )
                      ],
                    ),
                    backgroundColor: Colors.green,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('2736 Ratings')
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Text(
                  '14,999 ',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough),
                ),
                Text(
                  '\u{20B9} 10,999',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '26% Off',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 20),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text('FREE Delivery')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'EMI from 376/month',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black)),
              margin: EdgeInsets.all(8),
              // padding: EdgeInsets.all(1),
              width: double.infinity,
              height: 70,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.add_task_rounded,
                              color: Colors.green,
                            ),
                            Text(
                              '7 Days Replacement',
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            ),
                          ]),
                    ),
                    SizedBox(
                      width: 1,
                      height: 60,
                      child: Container(color: Colors.black),
                    ),
                    Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.add_task_rounded,
                              color: Colors.green,
                            ),
                            Text(
                              'Cash on Delivery \n Available',
                              softWrap: true,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.fade,
                            ),
                          ]),
                    ),
                    SizedBox(
                      width: 1,
                      height: 60,
                      child: Container(color: Colors.black),
                    ),
                    Container(
                      child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.add_task_rounded,
                              color: Colors.green,
                            ),
                            Text(
                              'F-Assured Product',
                              overflow: TextOverflow.fade,
                              softWrap: true,
                            ),
                          ]),
                    ),
                  ]),
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              width: double.infinity,
              child: Text(
                'Highlights',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            ListTile(
              leading: Icon(Icons.radar),
              title: Text('4 GB RAM | 64 GB ROM'),
              subtitle: Text('RAM | ROM'),
            ),
            ListTile(
              leading: Icon(Icons.radar),
              title: Text('6.7 inch Display'),
              subtitle: Text('DISPLAY'),
            ),
            ListTile(
              leading: Icon(Icons.radar),
              title: Text('PROCESSOR'),
              subtitle: Text('Octo Core 2.5 Ghz'),
            ),
            ListTile(
              leading: Icon(Icons.radar),
              title: Text('50 MP + 20 MP'),
              subtitle: Text('REAR CAMERA'),
            ),
            ListTile(
              leading: Icon(Icons.radar),
              title: Text('6000 mAh'),
              subtitle: Text('BATTERY'),
            )
          ],
        ),
      ),
    );
  }
}
