import 'package:flutter/material.dart';
import 'yeet.dart';
import 'package:yeetpost/yeet.dart';

class Trending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 40, top: 20, bottom: 20),
          child: Text(
            'Trending',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30.0
            )
          ),
        ),
        Yeet().buildTrendingYeets()
      ],
    );
  }
}