import 'package:crud_mthd/get_page/home_get.dart';
import 'package:crud_mthd/get_page/repo/get_api.dart';
import 'package:crud_mthd/post_page/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home:  HomeGet(),
      home: ChangeNotifierProvider(
        create: (context) => ApiRepo(),
        child: HomeGet(),
      ),
    );
  }
}
