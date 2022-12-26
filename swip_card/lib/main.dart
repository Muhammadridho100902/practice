import 'package:flutter/material.dart';
import 'package:swip_card/home.dart';

void main(){
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePageWidget(),
    );
  }
}