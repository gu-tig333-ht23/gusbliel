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
      title: 'TIG333 TODO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          background: Color.fromARGB(255, 249, 195, 210),
          primary: Color.fromARGB(255, 255, 145, 175),
          onPrimary: Colors.white,
          secondary: Color.fromARGB(255, 255, 145, 175),
          onSecondary: Colors.white,
        ),
        //iconTheme: IconThemeData(color: Colors.white),

        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 255, 145, 175),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        snackBarTheme: SnackBarThemeData(
          contentTextStyle: TextStyle(color: Colors.white),
          backgroundColor: Color.fromARGB(255, 255, 145, 175),
        ),
        popupMenuTheme: PopupMenuThemeData(color: Color.fromARGB(255, 255, 145, 175)),
        useMaterial3: true,
      ),
      home: HomePageView(),
    );
  }
}
