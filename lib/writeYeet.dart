import 'package:flutter/material.dart';
import 'package:yeetpost/locationYeetPage.dart';
import 'package:yeetpost/machineLearning.dart';
import 'classifyText.dart';
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
            onChanged: (val) {
              setState(() => yeetText = val);
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
                  Text('Yeet', style: TextStyle(fontSize: 24.0)),
                ],
              ),
            ),
            onPressed: () async {
              if (_formkey.currentState.validate()) {
                ClassifyText.classify(yeetText).then((result) {
                  if (result == "0") {
                    print("offensive");
                    ClassifyText.cyberbullyAlert(context).then((alert){
                      return alert;
                    });
                  } else {
                    DatabaseService().writeYeet(dropdownValue, "test author", yeetText);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LocationYeetPage(dropdownValue))
                    );
                  }
                });
              }
            },
          ),
          SizedBox(height: 10),
          Text(
            error,
            style: TextStyle(color: Colors.red),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: Color(0xFF21BFBD),
        body: Container(
          height: MediaQuery.of(context).size.height - 80.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(60.0)),//75
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 40, top: 20, right: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Write Yeet',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontFamily: 'Montserrat',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  SizedBox(height: 30.0,),
                  buildDropdown(context),
                  SizedBox(height: 35.0,),
                  yeetInputField(),
                  RaisedButton(
                    textColor: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Machine Learning Test', style: TextStyle(fontSize: 24.0)),
                        ],
                      ),
                    ),
                    onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MachineLearning())
                        );
                    },
                  ),
                ]
              ),
            ),
          ),
        )
      ),
    );
  }

}



