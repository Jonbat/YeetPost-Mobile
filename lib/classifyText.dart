import 'package:flutter/material.dart';
import 'decodejson.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class ClassifyText {

  static Future<String> classify (text) {
    Tokenize ondevice = Tokenize(1000, 'assets/devive_json.json');
    List<int> inp = List();
    return ondevice.getTokenized(text).then((value) {
      inp = value;
    }).then((_) {
      return MethodChannel('yeetpostML').invokeMethod('predictData', {"arg": inp}).then((value) {
        return value;
      });
    });
  }

  static Future<Widget> cyberbullyAlert(context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
          title: Text('Cyberbullying detected'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Please re-write message without cyberbullying'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Okay',
                style: TextStyle(
                  color: Color(0xFF21BFBD),
                  fontFamily: 'Montserrat',
                  fontSize: 20.0,
                )
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
