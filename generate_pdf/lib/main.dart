import 'package:flutter/material.dart';
import 'package:generate_pdf/home_controller.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Generate PDF"),
      ),
      body: ListView.builder(
        itemCount: controller.products.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(
                "${controller.products[index]['id']}",
              ),
            ),
            title: Text(
              "${controller.products[index]['name']}",
            ),
            subtitle: Text(
              "${controller.products[index]['date']}",
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.getPdf(),
        child: const Center(
          child: Icon(
            Icons.file_copy_rounded
          ),
        ),
      ),
    );
  }
}
