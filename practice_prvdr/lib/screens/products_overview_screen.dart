import 'package:flutter/material.dart';
import 'package:practice_prvdr/widgets/widget_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: Widget_Grid(),
    );
  }
}

