import 'package:flutter/material.dart';
import 'services/auth.dart';

class Profile extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              'Current Name : Anonymous',
              style: TextStyle(
                color: Colors.grey[600],
                fontFamily: 'Montserrat',
                fontSize: 16.0,
                fontWeight: FontWeight.bold
              )
            ),
          ),
          TextFormField(
            focusNode: null,
            decoration: InputDecoration(
              labelText: "New Name...",
              // change label color on focus: https://stackoverflow.com/questions/56411599/flutter-textformfield-change-labelcolor-on-focus/56411859
            ),
            validator: (val) {
              if (val.length > 15) {
                return "Name can't be longer than 15 characters";
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.text,
            style: TextStyle(
              fontFamily: "Poppins",
            ),
          ),
          SizedBox(height: 10.0,),
          RaisedButton(
            textColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Set name', style: TextStyle(fontSize: 24.0)),
                ],
              )
            ),
            onPressed: () {},
          ),
          SizedBox(height: 20.0,),
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
    );
  }
}