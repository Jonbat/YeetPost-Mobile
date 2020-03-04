import 'package:flutter/material.dart';
import 'services/database.dart';

String profileName = "Profile name";
String dropdownValue;

class WriteYeet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WriteYeetState();
  }
}

class WriteYeetState extends State<WriteYeet> {

  final _formkey = GlobalKey<FormState>();
  String yeetText;
  bool loading = false;
  String error = '';

  Widget buildDropdown(BuildContext context) {
    return StreamBuilder<List<String>> (
      stream: DatabaseService().locations,
      builder: (context, locations) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
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
                items: 
                  locations.hasData ? locations.data.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                        style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16
                        )
                      ),
                    );
                  })
                  .toList()
                : null
              ),
            ),
          ],
        );
      }
    );
  }

  Widget yeetInputField() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            textCapitalization: TextCapitalization.sentences,
            maxLength: 150,
            decoration: InputDecoration(
              labelText: "Yeet text...",
            ),
            validator: (val) => val.isEmpty ? 'Enter a yeet' : null,
            onChanged: (val){
              setState(() => yeetText = val);
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
                  Text('Yeet', style: TextStyle(fontSize: 24.0)),
                ],
              ),
            ),
            onPressed: () async {
              if (_formkey.currentState.validate()) {
                setState(() {
                  loading = true;
                });
                DatabaseService().writeYeet("Southern Adventist University", "test author", yeetText);
                
                // dynamic result =  DatabaseService().writeYeet(location, author, yeetText);//_auth.signInWithEmailAndPassword(email, password);
                /*
                if (result == null) {
                  setState(() {
                    error = 'Could not yeet';
                    loading = false;
                  });
                }
                */
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

              yeetInputField(),

              /*
              TextFormField(
                textCapitalization: TextCapitalization.sentences,
                maxLength: 150,
                decoration: InputDecoration(
                  labelText: "Yeet text...",
                ),
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
                      Text('Yeet', style: TextStyle(fontSize: 24.0)),
                    ],
                  )
                ),
                onPressed: () {},
              )
              */
            ]
          ),
        ),
      )
    );
  }

    
    
}



