import 'package:flutter/material.dart';
import "HomePageView.dart";
import "package:provider/provider.dart";
import 'TaskListItem.dart';
import "TaskFilter.dart";

void main() {
  TaskListItemState taskState = TaskListItemState();
  TaskFilterModel filterModel = TaskFilterModel(); // Add this line

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => taskState),
        ChangeNotifierProvider(create: (context) => filterModel), // Add this line
      ],
      child: MyApp(),
    ),
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





