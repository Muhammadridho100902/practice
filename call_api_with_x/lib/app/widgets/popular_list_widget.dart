import 'package:call_api_with_x/app/controller/popular_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListPopularWidget extends StatelessWidget {
  const ListPopularWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList;
    return Container(
      margin: const EdgeInsets.all(20),
      width: Get.width,
      height: Get.height,
      child: ListView.builder(
        itemCount: product.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${product[index].name}"),
            subtitle: Text("Price: ${product[index].name}"),
          );
        },
      ),
    );
  }
}
