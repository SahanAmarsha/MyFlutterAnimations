import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  int x =1;

  AnimationController _controller;
  Animation<double> _slideAnimation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;


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
      duration: Duration(milliseconds: 500),
    );


    _slideAnimation = Tween(begin: 100.0, end: 50.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 1.0, curve: Curves.elasticIn),
      ),
    )..addStatusListener((status) {
      _animationStatus = status;
    });

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
      AnimatedBuilder(animation: _slideAnimation,
          builder: (ctx, ch) =>  Container(
            width: 100,
            height: 100,

            decoration: BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage(
                      'assets/images/bounce-ball.png',
                    )
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
          if (_animationStatus == AnimationStatus.dismissed) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        },
      ),
    );
  }
}
