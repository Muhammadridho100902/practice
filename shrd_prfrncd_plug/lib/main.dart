import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  bool isDark = false;

  void add() {
    counter = counter + 1;

    sharedPreferenced();
  }

  void minus() {
    counter = counter - 1;

    sharedPreferenced();
  }

  ThemeData dark = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: Colors.grey,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.black),
  );

  ThemeData light = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.green,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: Colors.white,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.green),
  );

  void changeTheme() {
    isDark = !isDark;
    sharedPreferenced();
  }

  Future<void> sharedPreferenced() async {
    // 1. membuat jembatan instance
    final jembatan = await SharedPreferences.getInstance();

    // 3. melakukan pengecekan variable data lalu clear
    if (jembatan.containsKey('data')) {
      jembatan.clear();
    }

    // 2. encode data to json dan masukan apa saja yg ingin disimpan seperti counter dan isDark
    final data = json.encode({
      'counter': counter.toString(),
      'isDark': isDark.toString(),
    });

    // 4. set string variable jembatan
    jembatan.setString('data', data);

    // 5. gunakan setState pd fungsi ini agar tidak memanggil berulang di fungsi add, minus, changeTheme
    setState(() {});
  }

  Future<void> getPreferenced() async {
    // 6. membuat jembatan lagi pertama kali
    final jembatan = await SharedPreferences.getInstance();

    // 7. melakukan pengecekan, jika ada datanya, data akan di decode
    // disini karna data counter itu int dan data isDark is bool
    // maka harus dijadikan string dan akan dijadikan sebuah mapping
    if (jembatan.containsKey('data')) {
      final data = json.decode(jembatan.getString("data").toString())
          as Map<String, dynamic>;

      counter = int.parse(data['counter']);
      isDark = data['isDark'] == "true" ? true : false;
    }
  }

  @override
  Widget build(BuildContext context) {

    //8. membuat future builder untuk memanggil fungsi getPreferenced
    /////////////////// selesai ///////////////////
    return FutureBuilder(
      future: getPreferenced(),
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: isDark ? dark : light,
        home: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Angka Saat ini : $counter",
                  style: isDark
                      ? const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        )
                      : const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: add,
                      icon: Icon(Icons.add,
                          color: isDark ? Colors.white : Colors.black),
                    ),
                    IconButton(
                      onPressed: minus,
                      icon: Icon(Icons.remove,
                          color: isDark ? Colors.white : Colors.black),
                    )
                  ],
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: changeTheme,
            child: const Icon(Icons.color_lens_outlined),
          ),
        ),
      ),
    );
  }
}
