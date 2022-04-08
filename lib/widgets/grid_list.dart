import 'package:flutter/material.dart';
import '../widgets/product_item.dart';

class GridList extends StatelessWidget {
  final int listCount;

  GridList(this.listCount);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
        children: List.generate(listCount, (index) {
          return ProductItem(index);
        }),
      );
    });
  }
}
