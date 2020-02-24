import 'package:flutter/material.dart';

class CustomTextBox extends StatelessWidget {
  final String inputText;
  CustomTextBox(this.inputText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275,
      child: Text(
        inputText,
        overflow: TextOverflow.ellipsis,
        maxLines: 5,
        style: TextStyle(
          fontFamily: 'Montserrat',
          height: 1.15,
          fontSize: 18.0,
        )
      ),
    );
  }
}