import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF21BFBD),
        elevation: 0,
        title: Text('Sign up for YeetPost'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 40,),
        child: Form(
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
                      Text('Register', style: TextStyle(fontSize: 24.0)),
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
        )
      )
    );
  }
}