import 'package:flutter/material.dart';

import 'util.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
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
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          Text(
            'CANCEL',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text('Order#568'),
            Text('00 : 15 : 01'),
            Container(
              child: Row(),
            ),
            Image.asset('assets/images/Ober.png'),
            Text('Order Confirmed'),
            OutlineButton(
              child: Text("GO TO TRUCK"),
              onPressed: null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
