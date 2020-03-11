import 'package:flutter/material.dart';
import 'package:yeetpost/yeet.dart';

class LocationYeetPage extends StatelessWidget {
  final String location;
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
      body: Yeet().buildLocationYeets(location)
    );
  }
}

