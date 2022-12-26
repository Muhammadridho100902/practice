import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:practice_prvdr/models/product.dart';

class Products with ChangeNotifier {
  // 1. create a private list
  final List<Product> _allProduct = List.generate(
    25,
    (index) {
      return Product(
        id: "id_${index + 1}",
        title: "Product ${index + 1}",
        description: 'Ini adalah deskripsi produk ${index + 1}',
        price: 10 + Random().nextInt(100).toDouble(),
        imageUrl: 'https://picsum.photos/id/$index/200/300',
      );
    },
  );

  // 2. create a getter list to allProduct
  List<Product> get allProduct {
    return [..._allProduct];
  }

  // 3. create prodcut findbyid 
  Product findById(productId){
    return _allProduct.firstWhere((prodId) => prodId.id == productId);
  }
}
