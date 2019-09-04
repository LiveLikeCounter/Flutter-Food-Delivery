import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  Timer({Key key}) : super(key: key);
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> with TickerProviderStateMixin {
  AnimationController animationController;

  String get timerString {
    Duration duration = animationController.duration * animationController.value;
    return '${(duration.inHours % 60).toString().padLeft(2, '0')} : ${(duration.inMinutes % 60).toString().padLeft(2, '0')} : ${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 8800),
      vsync: this,
    );
    animationController.reverse(from: animationController.value == 0.0 ? 1.0 : animationController.value);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedBuilder(
            animation: animationController,
            builder: (BuildContext context, Widget child) => Text(
              timerString,
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
