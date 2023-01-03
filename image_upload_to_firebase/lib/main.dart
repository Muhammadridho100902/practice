

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_upload_to_firebase/page/show_image.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShowImage(),
    );
  }
}


