import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:generate_pdf_from_firebase/views/addplayer.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final fb = FirebaseDatabase.instance;

  var notes;

  var g;

  var k;

  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child("players");
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 70, right: 20),
                        child: Text(
                          "Hi, Welcome",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        color: const Color.fromARGB(255, 0, 0, 0),
                        iconSize: 36,
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                title: const Text(
                                  "Do You Want to Log Out?",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                actions: <Widget>[
                                  MaterialButton(
                                    onPressed: () {},
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    child: const Text("Cancel"),
                                  ),
                                  MaterialButton(
                                    onPressed: () async {},
                                    color: Colors.red,
                                    textColor: Colors.white,
                                    child: const Text("Log out"),
                                  )
                                ]),
                          );
                        },
                        icon: const Icon(Icons.person),
                        color: const Color.fromARGB(255, 0, 0, 0),
                        iconSize: 36,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                FirebaseAnimatedList(
                  shrinkWrap: true,
                  query: ref,
                  itemBuilder: (context, snapshot, animation, index) {
                    var v = snapshot.value.toString();
                    g = v.replaceAll(RegExp("university: |name: "), "");
                    g.trim();
                    notes = g.split(',');
                    if (snapshot.exists) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            k = snapshot.key;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: [0.1, 1],
                                  colors: <Color>[
                                    const Color(0xFFffffff).withOpacity(0.45),
                                    const Color(0xFFFFFFFF).withOpacity(0.2),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: ListTile(
                              trailing: IconButton(
                                onPressed: () {
                                  ref.child(snapshot.key!).remove();
                                  // Delete();
                                },
                                icon: const Padding(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 40,
                                  ),
                                ),
                              ),
                              title: Padding(
                                padding:
                                    const EdgeInsets.only(right: 10, top: 15),
                                child: Text(
                                  notes[1],
                                  style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text("Data doesn't exist"),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(()=> const AddPlayer());
        },
        child: const Icon(Icons.person),
      ),
    );
  }
}
