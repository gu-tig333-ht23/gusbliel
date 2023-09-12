import 'package:flutter/material.dart';

class AddTaskView extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(  
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