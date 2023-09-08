import 'package:flutter/material.dart';
import 'package:template/TaskListItem.dart';

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

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePageView(),
    );
  }
}

class HomePageView extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 189, 188, 188),
        centerTitle: true,
        title: Text("TIG333 TODO"),
        actions: [
          IconButton(icon: Icon(Icons.more_vert), onPressed: (null))
        ],
        
      ),
      body: ListView(
        children: [
          TaskListItem(taskText: "Slänga sopor"),
          TaskListItem(taskText: "Handla smör"),
          TaskListItem(taskText: "Erövra Paraguay"),
          TaskListItem(taskText: "Vattna blommor")
        ]
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddTaskView()));
        },
        
        backgroundColor: const Color.fromARGB(255, 189, 188, 188),
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddTaskView extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: const Color.fromARGB(255, 189, 188, 188),
        
        centerTitle: true,
        title: Text("TIG333 TODO"),
        actions: [
          IconButton(icon: Icon(Icons.more_vert), onPressed: (null))
        ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter task name',
              ),
            ),
            SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                
              },
              style: TextButton.styleFrom(
                textStyle: TextStyle(color: Colors.black),

              ),
              child: Text('+ ADD', style:
                TextStyle(color: Colors.black),),
            ),
        ]
       )
     )
    );
  }
}

