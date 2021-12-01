import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  var reciveddata;
  HomePage({this.reciveddata});
  //const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Center(
  child: CircleAvatar(
    radius: 100,
    child: Image.network(reciveddata["avatar"],),
  ),
),
    );
  }
}
