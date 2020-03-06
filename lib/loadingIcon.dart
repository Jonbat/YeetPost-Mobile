import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIcon extends StatelessWidget {
  final double sizeInput;
  LoadingIcon(this.sizeInput);
  @override
  Widget build(BuildContext context) {
    return SpinKitChasingDots(
      color: Color(0xFF21BFBD),
      size: sizeInput,
    );
  }
}