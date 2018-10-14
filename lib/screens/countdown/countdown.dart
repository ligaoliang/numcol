import 'package:flutter/material.dart';
import '../../routes.dart';
import 'widgets/index.dart';

class CountdownScreen extends StatefulWidget {
  @override
  _CountdownScreenState createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> with TickerProviderStateMixin {
  static const int startValue = 4;

  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    var _animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: startValue),
    );
    _animation = new StepTween(
        begin: startValue,
        end: 0,
      ).animate(_animationController);
    _animation.addStatusListener((animationStatus) {
      if (animationStatus == AnimationStatus.completed) {
        Navigator.popAndPushNamed(context, Routes.game);
      }
    });
    _animationController.forward(from: 0.0);
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Center(
          child: new CountdownWidget(
            animation: _animation,
          ),
        ),
      ),
    );
  }
}
