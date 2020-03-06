import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
import 'services/auth.dart';


class Profile extends StatelessWidget {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  //String error = "something";
  String newName;

  Widget nameInputField() {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                textCapitalization: TextCapitalization.sentences,
                maxLength: 150,
                decoration: InputDecoration(
                  labelText: "New name",
                ),
                validator: (val) => val.isEmpty ? 'Enter a name' : null,
                onChanged: (val){
                  setState(() => newName = val);
                }
              ),
              SizedBox(height: 10),
              RaisedButton(
                textColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Change name', style: TextStyle(fontSize: 24.0)),
                    ],
                  ),
                ),
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                    _auth.changeDisplayName(newName);
                  }
                },
              ),
              SizedBox(height: 10),
              /*
              Text(
                error,
                style: TextStyle(color: Colors.red),
              )
              */
            ],
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.only(left: 40, top: 20, bottom: 25, right: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile',
              style: TextStyle(
                color: Colors.grey[950],
                fontFamily: 'Montserrat',
                fontSize: 30.0,
                fontWeight: FontWeight.bold
              )
            ),
            //SizedBox(height: 50.0,),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 40,),
              child: Text(
                'Current Name : ' + user.name,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontFamily: 'Montserrat',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
            nameInputField(),
            SizedBox(height: 30.0,),
            RaisedButton(
              textColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Sign Out', style: TextStyle(fontSize: 24.0)),
                  ],
                )
              ),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ]
        ),
      ),
    );
  }
}