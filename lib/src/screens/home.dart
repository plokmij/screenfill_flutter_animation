import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  double width;
  double height;
  Home({
    this.width,
    this.height,
  });
  _HomeState createState() => _HomeState(
        width: width,
        height: height,
        ratio: width / height,
      );
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> fillAnimation;
  AnimationController fillController;
  double width, height, ratio;
  bool fullScreen = false;

  _HomeState({this.width, this.height, this.ratio});

  initState() {
    //double width = MediaQuery.of(context).size.width;

    super.initState();

    fillController = AnimationController(
      duration: Duration(milliseconds: 100),
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
      appBar: !fullScreen
          ? AppBar(
              title: Text("Animation"),
            )
          : null,
      body: Center(
        child: InkWell(
          onTap: () {},
          child: buildAnimation(),
        ),
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
    setState(() {
      if (fullScreen) {
        fullScreen = false;
      } else {
        fullScreen = true;
      }
    });
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
            child: fullScreen
                ? Center(
                    child: Text(
                    "My Fucken Animation",
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ))
                : null,
            height: fillAnimation.value / ratio,
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
