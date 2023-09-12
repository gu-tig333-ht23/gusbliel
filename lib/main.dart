import 'package:flutter/material.dart';
import "HomePageView.dart";


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 145, 175)), //hehehe
        useMaterial3: true,
      ),
      home: HomePageView(),
    );
  }
}





