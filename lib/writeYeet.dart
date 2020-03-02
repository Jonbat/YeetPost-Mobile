import 'package:flutter/material.dart';

String profileName = "Profile name";
var dropdownValue;

class WriteYeet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WriteYeetState();
  }
}

class WriteYeetState extends State<WriteYeet> {

  Widget buildDropdown(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: Color(0xFF21BFBD),
          size: 30.0
        ),
        Container(
          width: 290,
          child: DropdownButton<String>( 
            hint: Text("Choose a Location"),
            value: dropdownValue,
            isExpanded: true,
            icon: Icon(
              Icons.arrow_downward,
              color: Color(0xFF21BFBD),
              size: 30.0
            ),
            iconSize: 30,
            elevation: 16,
            underline: Container(
              height: 1,
              color: Colors.grey[600],
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['SAU', 'Two', 'Free', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,
                  style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 20
                  )
                ),
              );
            })
            .toList(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(60.0)),//75
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 40, top: 20, right: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Yeet',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontFamily: 'Montserrat',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
                )
              ),
              SizedBox(height: 30.0,),
              buildDropdown(context),
              SizedBox(height: 30.0,),
              TextFormField(
                maxLength: 150,
                decoration: InputDecoration(
                  labelText: "Yeet text...",
                ),
                validator: (val) {
                  if (val.length > 150) {
                    return "Yeet can't be longer than 15 characters";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                textColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Send Yeet', style: TextStyle(fontSize: 24.0)),
                    ],
                  )
                ),
                onPressed: () {},
              )
            ]
          ),
        ),
      )
    );
  }
}

