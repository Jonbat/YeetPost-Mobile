import 'package:yeetpost/services/auth.dart';
import 'package:flutter/material.dart';
import 'register.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  // text field stats
  String email = '';
  String password = '';

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
          children: [
            signInField(),
            SizedBox(height: 20),
            Text("Don\'t have an account?"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  textColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Sign in anonymously', style: TextStyle(fontSize: 14.0)),
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
                Text("Or",),
                RaisedButton(
                  textColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Register', style: TextStyle(fontSize: 14.0)),
                      ],
                    ),
                  ),
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register())
                      );
                  },
                ),
              ],
            ),
          ],
        ),
      )
    );
  }

  Widget signInField() {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Email",
            ),
            onChanged: (val){
              setState(() => email = val);
            }
          ),
          SizedBox(height: 20),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
            ),
            onChanged: (val){
              setState(() => password = val);
            }
          ),
          SizedBox(height: 20),
          RaisedButton(
            textColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Sign in', style: TextStyle(fontSize: 24.0)),
                ],
              ),
            ),
            onPressed: () {
              print(email);
              print(password);
            },
          ),
        ],
      ),
    );
  }
}
