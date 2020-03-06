import 'package:flutter/material.dart';
import 'package:yeetpost/yeet.dart';

class LocationYeetPage extends StatelessWidget {
  final location;
  // Receive the selected verse from the verse selection
  LocationYeetPage(this.location);

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
      body: Yeet().buildLocationYeets(location)
    );
  }
}

