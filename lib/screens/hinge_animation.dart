import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation _rotateAnimation;
  Animation<double> _slideAnimation;
  Animation<double> _opacityAnimation;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    _rotateAnimation = Tween(end: 0.15, begin: 0.0)
        .animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.bounceInOut),
      ),
    );

    _slideAnimation = Tween(begin: 100.0, end: 600.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );

    _opacityAnimation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      ),
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

      body:
      AnimatedBuilder(
        animation: _slideAnimation,
        builder: (ctx, ch) => Container(
          width: 200,
          height: 100,
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.only(
            left: 75,
            top: _slideAnimation.value,
          ),
          child: RotationTransition(
            turns: _rotateAnimation,
            child: Center(
              child: Text('Animation', style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 0, 128, _opacityAnimation.value)
              ),),
            ),
          ),
        ),
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
