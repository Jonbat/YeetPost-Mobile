import 'package:yeetpost/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:yeetpost/loading.dart';
import 'register.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  String email;
  String password;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF21BFBD),
        elevation: 0,
        title: Text('Sign in to YeetPost'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 40,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            signInField(),
            SizedBox(height: 20),
            Text("Don\'t have an account?"),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Text("Register", 
                    style: TextStyle(color: Color(0xFF21BFBD)
                    )
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register())
                    );
                  },
                ),
                Text("  or  ",),
                InkWell(
                  child: Text("Sign in anonymously", 
                    style: TextStyle(color: Color(0xFF21BFBD)
                    )
                  ),
                  onTap: () async {
                    dynamic result = await _auth.signInAnon();
                    if (result == null) {
                      print('error signing in');
                    } else {
                      print('signed in');
                      print(result.uid);
                    }
                  },
                ),
              ]
            )
          ],
        ),
      )
    );
  }

  Widget signInField() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Email",
            ),
            validator: (val) => val.isEmpty ? 'Enter an email' : null,
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
            validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
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
            onPressed: () async {
              if (_formkey.currentState.validate()) {
                setState(() {
                  loading = true;
                });
                dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                if (result == null) {
                  setState(() {
                    error = 'Could not sign in';
                    loading = false;
                  });
                }
              }
            },
          ),
          SizedBox(height: 10),
          Text(
            error,
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    );
  }
}
