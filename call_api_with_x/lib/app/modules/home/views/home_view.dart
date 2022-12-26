import 'package:call_api_with_x/app/controller/popular_controller.dart';
import 'package:call_api_with_x/app/model/productModel.dart';
import 'package:call_api_with_x/app/widgets/popular_list_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: ListPopularWidget()
    );
  }
}
