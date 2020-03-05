import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yeetpost/locationYeets.dart';
import 'models/yeetModel.dart';

class YeetPage extends StatelessWidget {
  final location;
  // Receive the selected verse from the verse selection
  YeetPage(this.location);

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location),
          elevation: 0.0, // no shadow
          backgroundColor: Color(0xFF21BFBD),
      ),
      backgroundColor: Colors.white,
      // build yeets, based on location
      body: LocationYeets(location)
    );
  }
}

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

List<String> locationYeets = ["Location yeet 1", "Location yeet 2", "Location", "Location", "Location"];

