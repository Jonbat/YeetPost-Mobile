import 'package:first_app/authenticate/signIn.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  AuthenticateState createState() => AuthenticateState();
}

class AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}