import 'package:flutter/material.dart';
import 'package:flutter_http_test/src/pages/trainers_list/trainers_list.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child:
          Text(
              'Тренера',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30)),
          ),
        ),
        body: const LastNewsPage(),
      ),
    );
  }
}
