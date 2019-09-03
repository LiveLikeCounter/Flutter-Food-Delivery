import 'package:flutter/material.dart';

import 'util.dart';


class Avatar extends StatefulWidget {
  Avatar({Key key}) : super(key: key);

  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> with TickerProviderStateMixin {
  AnimationController animationController;
  var _avatarImage;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 8800),
    );
    animationController.forward();
    _avatarImage = Image.asset('assets/images/Pan.png', width: 125);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AvatarAnimation(controller: animationController, avatarImage: _avatarImage);
  }
}


class AvatarAnimation extends StatelessWidget {
  AvatarAnimation({Key key, this.controller, this.avatarImage}) : super(key: key);

  final AnimationController controller;
  final avatarImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: avatarImage,
      // child: Image.asset('assets/images/Pan.png', width: 125),
      // child: Image.asset('assets/images/FoodPackage.png', width: 125),
    );
  }
}