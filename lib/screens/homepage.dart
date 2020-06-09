import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation _myAnimation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _myAnimation = Tween(end: 0.15, begin: 0.0)
        .animate(
        CurvedAnimation(parent: _controller, curve: Curves.bounceIn)
    );

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Animations"),
      ),

      body: Center(
          child: RotationTransition(
            turns: _myAnimation,
            child: Container(
              width: 200,
              height: 200,
              child: Center(
                child: Text('Animation', style: TextStyle(
                  fontSize: 40,

                ),),
              )
            ),
          )
      ),

      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,

      floatingActionButton:
      FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: (){

            _controller.forward();

        },
      ),
    );
  }
}
