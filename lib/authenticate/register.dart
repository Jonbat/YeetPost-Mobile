import 'package:flutter/material.dart';
import 'package:yeetpost/services/auth.dart';
import 'package:yeetpost/loadingPage.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  String email;
  String password;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? LoadingPage() :Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF21BFBD),
        elevation: 0,
        title: Text('Sign up for YeetPost'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 40,),
        child: Form(
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
                      Text('Register', style: TextStyle(fontSize: 24.0)),
                    ],
                  ),
                ),
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Please provide a valid email';
                        loading = false;
                      });
                    } else {
                      Navigator.pop(context);
                    }
                  }
                },
              ),
              SizedBox(height: 10),
              Text( // error text
                error,
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
        )
      )
    );
  }
}