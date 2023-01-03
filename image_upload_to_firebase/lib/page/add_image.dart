import 'dart:io';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? image;
  final fb = FirebaseDatabase.instance;
  final imageId = Random().nextInt(100);

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path.toString());
    setState(() {});
    print(image!.path);
  }

  Future saveImage() async {
    final ref = fb.ref().child('image/$imageId');
    ref.set({
      "imageId": imageId.toString(),
      "image": image.toString(),
    }).asStream();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => HomePage(),
    ));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Image Picker"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image != null
                ? SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.file(
                      image!,
                      fit: BoxFit.cover,
                    ),
                  )
                : Container(),
            const SizedBox(
              height: 20,
            ),
            image != null
                ? Text(
                    image!.path,
                    textAlign: TextAlign.center,
                  )
                : const Text("Belum Ada Gambar"),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
              onPressed: () async {
                await getImage();
              },
              child: const Text(
                'Open Image',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            image != null ? TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
              onPressed: () async {
                await saveImage();
              },
              child: const Text(
                'Save Image',
                style: TextStyle(color: Colors.white),
              ),
            ) : Container()
          ],
        ),
      ),
    );
  }
}