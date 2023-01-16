import 'package:flutter/material.dart';
import 'package:post_method_api/model/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Api api = Api();

    void addData() {
      api.postData("Jumat", "Solat").then((value) {
        setState(() {
          api = value;
        });
        print("${api.id} || ${api.name} || ${api.job}");
        print("Berhasil post");
      });
    }

    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: ()  {
              addData();
            },
            child: const Text("Post"),
          )
        ],
      )),
    );
  }
}
