@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Flutter Animations"),
    ),

    body: Center(
      child:
      SlideTransition(
        position: _myAnimation,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: FlutterLogo(size: 150.0),
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