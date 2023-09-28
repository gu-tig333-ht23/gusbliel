import 'package:flutter/material.dart';
import 'package:template/get_todos_from_api.dart';
import 'home_page_view.dart';
import "package:provider/provider.dart";
import 'todo_filter.dart';

void main() {
  TodoFilterState filterModel = TodoFilterState();
  TodoState todoState = TodoState();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => filterModel),
        ChangeNotifierProvider(create: (context) => todoState),
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
      //Sets a very soothing theme
      theme: ThemeData(
        //Using ColorsScheme.dark allows me to have all text be white with minimal effort. 
        colorScheme: ColorScheme.dark(
          background: Color.fromARGB(255, 249, 195, 210),
          primary: Color.fromARGB(255, 255, 145, 175),
          onPrimary: Colors.white,
          secondary: Color.fromARGB(255, 255, 145, 175),
          onSecondary: Colors.white,
        ),

        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 255, 145, 175),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        snackBarTheme: SnackBarThemeData(
          contentTextStyle: TextStyle(color: Colors.white),
          backgroundColor: Color.fromARGB(255, 255, 145, 175),
        ),
        popupMenuTheme:
            PopupMenuThemeData(color: Color.fromARGB(255, 255, 145, 175)),
        useMaterial3: true,
      ),
      home: HomePageView(),
    );
  }
}
