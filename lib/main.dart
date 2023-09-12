import 'dart:js';

import 'package:flutter/material.dart';
import "HomePageView.dart";
import "package:provider/provider.dart";
import 'TaskListItem.dart';

void main() {
  TaskListItemState state = TaskListItemState();

  runApp(
    ChangeNotifierProvider(create: (context) => state,
    child: MyApp(),
    )
  );
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





