import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  CustomButton([this.buttonText]);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      textColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(buttonText, style: TextStyle(fontSize: 24.0)),
          ],
        )
      ),
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0))
    );
  }
}
  