import 'package:flutter/material.dart';
import 'package:yeetpost/services/auth.dart';
import 'package:yeetpost/loadingPage.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  String email;
  String instructions = '';

  @override
  Widget build(BuildContext context) {
    return loading ? LoadingPage() :Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF21BFBD),
        elevation: 0,
        title: Text('Forgot Password'),
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
              RaisedButton(
                textColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Reset Password', style: TextStyle(fontSize: 24.0)),
                    ],
                  ),
                ),
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                    _auth.resetPassword(email);
                    setState(() {
                      instructions = 'A password-reset link has been sent to ' + email;
                    });
                    Future.delayed(Duration(seconds: 2), () {
                      Navigator.pop(context);
                    });
                  }
                },
              ),
              SizedBox(height: 20),
              Text(
                instructions,
              )
            ],
          ),
        )
      )
    );
  }
}