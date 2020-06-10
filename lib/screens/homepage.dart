import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation<Size> _myAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat(reverse: true);
      }
    });

    _myAnimation = Tween<Size>(
        begin: Size(100, 100),
        end:  Size(120, 120)
    ).animate(
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
          child:
          AnimatedBuilder(animation: _myAnimation,
              builder: (ctx, ch) =>  Container(
                width: _myAnimation.value.width,
                height: _myAnimation.value.height,

                decoration: BoxDecoration(
                    image: new DecorationImage(
                        image: new AssetImage(
                          'assets/images/heart.png',
                        )
                    )
                ),
              )
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
