import 'package:flutter/material.dart';

class WriteYeet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WriteYeetPage(),
    );
  }
}

class WriteYeetPage extends StatefulWidget {
  @override
  WriteYeetPageState createState() => WriteYeetPageState();
}

String profileName = "Profile name";
var dropdownValue;

class WriteYeetPageState extends State<WriteYeetPage> {

  Widget buildDropdown(BuildContext context) {
    return DropdownButton<String >(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      isExpanded: true,
      iconSize: 24,
      elevation: 16,
      style: TextStyle(
        color: Colors.grey[600]
      ),
      underline: Container(
        height: 2,
        color: Colors.grey[600],
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
        .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        })
        .toList(),
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
          padding: const EdgeInsets.only(left: 40, top: 20, bottom: 20, right: 40),
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
              SizedBox(height: 25.0,),
              Text(
                'Choose Location',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontFamily: 'Montserrat',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                )
              ),
              buildDropdown(context),
              SizedBox(height: 10.0,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Yeet text...",
                  fillColor: Colors.black,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                    ),
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
      )
    );
  }
}

