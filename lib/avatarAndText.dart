import 'package:flutter/material.dart';

class AvatarAndText extends StatefulWidget {
  AvatarAndText({Key key}) : super(key: key);

  _AvatarAndTextState createState() => _AvatarAndTextState();
}

class _AvatarAndTextState extends State<AvatarAndText>
    with TickerProviderStateMixin {
  AnimationController animationController;
  final imageOne = "assets/images/Ober.png";
  final textOne = "Order confirmed";
  final imageTwo = "assets/images/Pan.png";
  final textTwo = "Your order is being prepared";
  final imageThree = "assets/images/FoodPackage.png";
  final textThree = "Your order is ready to pick up";
  var actualImage = "assets/images/Ober.png";
  var actualText = "";

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 8800),
      vsync: this,
    );
    animationController.forward();
    animationController.addListener(() {
      if (animationController.value < 0.450) {
        setState(() {
          actualImage = imageOne;
          actualText = textOne;
        });
      } else if (animationController.value >= 0.450 &&
          animationController.value < 0.900) {
        setState(() {
          actualImage = imageTwo;
          actualText = textTwo;
        });
      } else if (animationController.value >= 0.900 &&
          animationController.value <= 1.0) {
        setState(() {
          actualImage = imageThree;
          actualText = textThree;
        });
      } else {
        // do nothing
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AvatarAnimation(
        controller: animationController, image: actualImage, text: actualText);
  }
}

class AvatarAnimation extends StatelessWidget {
  AvatarAnimation({Key key, this.controller, this.image, this.text})
      : super(key: key);

  final AnimationController controller;
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Column(
        children: <Widget>[
          Container(
            child: Image.asset(image, width: 125),
          ),
          SizedBox(height: 15),
          Text(
            text,
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
