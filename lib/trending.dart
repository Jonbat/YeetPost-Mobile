import 'package:flutter/material.dart';
import 'package:yeetpost/locationYeets.dart';

/*
List<YeetModel> trendingYeets = [
  YeetModel(
    author: 'example author',
    text: 'example text',
    time: Timestamp.now(),
    upvoteCount: 1,
    flagCount: 1
  ),
  YeetModel(
    author: 'example author 2',
    text: 'example text 2',
    time: Timestamp.now(),
    upvoteCount: 1,
    flagCount: 1
  ),
];
*/

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
        LocationYeets('Southern Adventist University')
      ],
    );
  }
}