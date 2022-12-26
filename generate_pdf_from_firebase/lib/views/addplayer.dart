import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:generate_pdf_from_firebase/views/Home.dart';
import 'package:get/get.dart';

class AddPlayer extends StatefulWidget {
  const AddPlayer({Key? key}) : super(key: key);

  @override
  State<AddPlayer> createState() => _AddPlayerState();
}

class _AddPlayerState extends State<AddPlayer> {
  TextEditingController nameController = TextEditingController();
  TextEditingController universityController = TextEditingController();

  final ref = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    var range = Random();
    var key = range.nextInt(1000);
    final fb = ref.ref().child("players/$key");

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Player"),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Player Name"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: universityController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "University"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                fb.set({
                  'name' : nameController.text,
                  'university' : universityController.text
                }).asStream();
                Get.to(() => const HomePage());
                print("data berhasil di input");
              },
              child: const Center(
                child: Text("Submit"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
