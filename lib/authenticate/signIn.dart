import 'package:yeetpost/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF21BFBD),
        elevation: 0,
        title: Text('Sign in to YeetPost'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 40,),
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            RaisedButton(
              textColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Sign in anonymously', style: TextStyle(fontSize: 24.0)),
                  ],
                ),
              ),
              onPressed: () async {
                dynamic result = await _auth.signInAnon();
                if (result == null) {
                  print('error signing in');
                } else {
                  print('signed in');
                  print(result.uid);
                }
              },
            ),
          ],
        ),
      )
    );
  }
}