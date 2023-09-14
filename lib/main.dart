import 'package:flutter/material.dart';
import 'home_page_view.dart';
import "package:provider/provider.dart";
import 'task_list_item.dart';
import 'task_filter.dart';

void main() {
  TaskListItemState taskState = TaskListItemState();
  TaskFilterModel filterModel = TaskFilterModel();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => taskState),
        ChangeNotifierProvider(create: (context) => filterModel),
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
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 255, 145, 175)), //hehehe
        useMaterial3: true,
      ),
      home: HomePageView(),
    );
  }
}
