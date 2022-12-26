import 'package:flutter/material.dart';
import 'package:practice_prvdr/provider/all_products.dart';
import 'package:practice_prvdr/widgets/product_item.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class Widget_Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 5. user the listener of.context to get the data from products
    final productData = Provider.of<Products>(context);

    // 6.
    final allproduct = productData.allProduct;
    //
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: allproduct.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: allproduct[i],
        child: ProductItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
