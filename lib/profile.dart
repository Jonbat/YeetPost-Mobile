import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => ProfilePageState();
}

String profileName = "Profile name";

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 40, top: 20, bottom: 20, right: 40),
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
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 15, right: 40),
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
                labelText: "New Name",
                // change label color on focus: https://stackoverflow.com/questions/56411599/flutter-textformfield-change-labelcolor-on-focus/56411859
                labelStyle: TextStyle(color: Colors.grey,),
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: Colors.grey[600],),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: Color(0xFF21BFBD),),
                ),
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
          ]
        ),
      ),
    );
  }
}