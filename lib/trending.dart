import 'package:flutter/material.dart';
import 'yeet.dart';

class Trending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TrendingPage(),
    );
  }
}

class TrendingPage extends StatefulWidget {
  @override
  TrendingPageState createState() => TrendingPageState();
}

List<String> trendingYeets = ["Trending yeet 1", "Trending yeet 2", "Banana", "Tomato", "Pancake"];

class TrendingPageState extends State<TrendingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
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
          Yeet().buildYeets(trendingYeets)
        ],
      ),
    );
  }
}