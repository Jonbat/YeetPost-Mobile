import 'package:flutter/material.dart';
import 'yeet.dart';

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
      body: Yeet().buildYeets(locationYeets)
    );
  }
}

List<String> locationYeets = ["Location yeet 1", "Location yeet 2", "Location", "Location", "Location"];

