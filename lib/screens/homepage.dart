import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Animations"),
      ),

      body: Center(
        child: Text('Animation', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: Color.fromRGBO(0, 51, 102, 1.0)
        ),
        ),
      ),

      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,

      floatingActionButton:
      FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: (){

        },
      ),
    );
  }
}
