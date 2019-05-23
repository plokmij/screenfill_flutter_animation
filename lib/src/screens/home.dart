import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  double width;
  Home({this.width});
  _HomeState createState() => _HomeState(
        width: width,
      );
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> fillAnimation;
  AnimationController fillController;
  double width;

  _HomeState({this.width});

  initState() {
    //double width = MediaQuery.of(context).size.width;

    super.initState();

    fillController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    //double endValue = MediaQuery.of(context).size.width;

    fillAnimation = Tween(begin: 50.0, end: width).animate(
      CurvedAnimation(
        parent: fillController,
        curve: Curves.decelerate,
      ),
    );

    //fillController.forward();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
      ),
      body: Center(
        child: buildAnimation(),
      ),
    );
  }

  onTap() {
    //print("Tapped");
    if (fillController.status == AnimationStatus.completed) {
      fillController.reverse();
    } else if (fillController.status == AnimationStatus.dismissed) {
      fillController.forward();
    } else {
      fillController.forward();
    }
  }

  Widget buildAnimation() {
    return AnimatedBuilder(
      animation: fillAnimation,
      builder: (context, child) {
        //child: child,
        return GestureDetector(
          onTap: onTap,
          child: Container(
            //olor: Colors.blue,
            height: 50,
            width: fillAnimation.value,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
        );
      },
    );
  }
}
