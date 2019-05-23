import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> fillAnimation;
  AnimationController fillController;

  initState() {
    super.initState();

    fillController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    //double endValue = MediaQuery.of(context).size.width;

    fillAnimation = Tween(begin: 50.0, end: 300.0).animate(
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
    if (fillController.status == AnimationStatus.completed){
      fillController.reverse();
    } else if ( fillController.status == AnimationStatus.dismissed){
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
