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
    Duration duration =
        animationController.duration * animationController.value;
    return '${(duration.inHours % 60).toString().padLeft(2, '0')} : ${(duration.inMinutes % 60).toString().padLeft(2, '0')} : ${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(hours: 2, minutes: 2, seconds: 2),
    );
    animationController.reverse(
        from:
            animationController.value == 0.0 ? 1.0 : animationController.value);
  }

  @override
  Widget build(BuildContext context) {
    // double sreenWidth = MediaQuery.of(context).size.width / 0.1;

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedBuilder(
              animation: animationController,
              builder: (BuildContext context, Widget child) {
                return Text(
                  timerString,
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),
                );
              }),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.center,
              child: CustomPaint(
                painter: ShapesPainter(),
                child: Container(
                  width: 290,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Recieved',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                ),
                Text(
                  'Preparing',
                  style: TextStyle(color: FoodColors.Grey, fontSize: 12),
                ),
                Text(
                  'Ready',
                  style: TextStyle(color: FoodColors.Grey, fontSize: 12),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = FoodColors.Grey;
    paint.strokeWidth = 2;
    paint.strokeCap = StrokeCap.round;

    // center of the canvas is (x,y) => (width/2, height/2)
    var dotFirst = Offset(10, 0);
    canvas.drawCircle(dotFirst, 12.0, paint);

    final lineOneStart = Offset(30, 0);
    final lineOneEnd = Offset(120, 0);
    canvas.drawLine(lineOneStart, lineOneEnd, paint);

    var dotSecond = Offset(140, 0);
    canvas.drawCircle(dotSecond, 12.0, paint);

    final lineTwoStart = Offset(160, 0);
    final lineTwoEnd = Offset(270, 0);
    canvas.drawLine(lineTwoStart, lineTwoEnd, paint);

    var dotThird = Offset(290, 0);
    canvas.drawCircle(dotThird, 12.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class TimerPainter extends CustomPainter {
  TimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }

  @override
  bool shouldRebuildSemantics(TimerPainter oldDelegate) => false;
}
