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

List<String> trendingYeets = ["Trending yeet 1", "Trending yeet 2", "Banana",];

class TrendingPageState extends State<TrendingPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 30, left: 50.0, bottom: 10),
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
        Container(
          padding: EdgeInsets.only(left: 45.0, right: 20.0),
          height: MediaQuery.of(context).size.height - 155.0,
          child: Yeet().buildYeets(trendingYeets)
        ),
      ],
    );
  }
}