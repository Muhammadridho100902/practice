import 'package:flutter/material.dart';

import 'package:lat_sql_lite/page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'Note App',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          appBarTheme: AppBarTheme(
            centerTitle: true,
          )
        ),
        home: const HomePage());
  }
}

