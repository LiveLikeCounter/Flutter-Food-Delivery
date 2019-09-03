import 'package:flutter/material.dart';

import 'package:flutter_fooddelivery/timer.dart';
import 'util.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Order(),
    );
  }
}

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  String animationName = 'Stroke';

  @override
  void initState() {
    super.initState();
    // ...
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 40,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                'CANCEL',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50),
            Text(
              'Order#568',
              style:
                  TextStyle(color: Color.fromRGBO(0, 0, 0, 0.2), fontSize: 12),
            ),
            Container(
              child: Timer(),
            ),
            SizedBox(height: 50),
            Image.asset('assets/images/Ober.png', width: 125),
            SizedBox(height: 20),
            Text(
              'Order Confirmed',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: OutlineButton(
                borderSide: BorderSide(width: 1.0, color: FoodColors.Blue),
                color: FoodColors.Blue,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 50),
                      Text(
                        'GO TO TRUCK',
                        style: TextStyle(fontSize: 15, color: FoodColors.Blue),
                      ),
                      SizedBox(width: 50),
                      Image.asset(
                        'assets/images/icon_direction.png',
                        scale: 2,
                      )
                    ],
                  ),
                ),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
