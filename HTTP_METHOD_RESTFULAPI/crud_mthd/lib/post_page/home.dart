import 'package:crud_mthd/post_page/api/api_repo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HttpStateful httpStateful = HttpStateful();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Post_Method"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            httpStateful.id == null
                ? const Text('Id: Belum ada data')
                : Text('Id: ${httpStateful.id}'),
            const SizedBox(
              height: 20,
            ),
            httpStateful.name == null
                ? const Text('Name: Belum ada data')
                : Text('Name: ${httpStateful.name}'),
            const SizedBox(
              height: 20,
            ),
            httpStateful.job == null
                ? const Text('Job: Belum ada data')
                : Text('Job: ${httpStateful.job}'),
            const SizedBox(
              height: 20,
            ),
            httpStateful.createdAt == null
                ? const Text('Created At: Belum ada data')
                : Text('Created At: ${httpStateful.createdAt}'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {
              httpStateful.connect("jons", "Tukang Cuci").then((value){
                setState(() {
                  print(value.name);
                  httpStateful = value;
                });
              });
            }, child: const Text("Post Data")),
          ],
        ),
      ),
    );
  }
}
