import 'authenticationWrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "YeetPost",
  
  theme: ThemeData(
    // update font later
    // String fontFamily : ,
    focusColor: Color(0xFF21BFBD),
    hoverColor: Color(0xFF21BFBD),
    highlightColor: Color(0xFF21BFBD),
    textSelectionColor: Color(0xFF21BFBD),
    textSelectionHandleColor: Color(0xFF21BFBD),
    //primaryColor:  Color(0xFF21BFBD),
    //accentColor: Colors.white,
    buttonTheme: ButtonThemeData(
      buttonColor: Color(0xFF21BFBD),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0)
      )
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: Colors.grey,
      ),
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.grey[600],
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Color(0xFF21BFBD),
        ),
      ),
    )),
    // textCapitalization: TextCapitalization.sentences,
    home: MyApp(),
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthenticationWrapper();
  }
}