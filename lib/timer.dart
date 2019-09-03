import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_fooddelivery/util.dart';

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
    print(timerString);
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



// class TimerStateFull extends StatefulWidget {
//   TimerStateFull({
//     @required AnimationController controller,
//     @required Duration timerDuration,
//   })  : animation = TimerAnimation(controller),
//         this.animationDuration = timerDuration;

//   final TimerAnimation animation;
//   final Duration animationDuration;

//   _TimerStateFullState createState() => _TimerStateFullState();
// }

// class _TimerStateFullState extends State<TimerStateFull>
//     with TickerProviderStateMixin {
//   AnimationController controller;

//   String get timerString {
//     Duration duration = controller.duration * controller.value;
//     return '${(duration.inHours % 60).toString().padLeft(2, '0')} : ${(duration.inMinutes % 60).toString().padLeft(2, '0')} : ${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
//   }

//   @override
//   void initState() {
//     super.initState();

//     controller = AnimationController(
//       duration: Duration(milliseconds: 2200),
//       vsync: this,
//     );
//     controller.reverse();

//     // animationForward = AnimationController(
//     //   duration: timerDuration,
//     //   vsync: this,
//     // );
//     // animationForward.forward();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     // animationForward.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: controller,
//       builder: (BuildContext context, Widget child) => Text(
//         timerString,
//         style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),
//       ),
//     );
//   }
// }
