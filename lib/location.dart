import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationPage(),
    );
  }
}

class LocationPage extends StatefulWidget {
  @override
  LocationPageState createState() => LocationPageState();
}

class LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: Container(
        alignment: Alignment.topCenter,
        //height: MediaQuery.of(context).size.height - 80.0,

        
        // ToDo: put the curve in front of listview?
        //  - Add gradient? linear with appbar
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
        ),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 40, top: 30),
              child: Text(
                'Locations',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0
                )
              ),
            ),
            buildLocations()
          ],
        )
      )
    );
  }
}

List<String> locations = ["SAU", "Duck", "Banana", "ChickenDuck", "Cow", "Frog", "Fish", "dog" , "dog", "dog", "dog", "dog"];

Widget buildLocations() {
  return ListView.separated(
    physics: ScrollPhysics(),
    padding: EdgeInsets.only(left: 60, right: 40),
    shrinkWrap: true,
    itemCount: locations.length,
    separatorBuilder: (context, index) {
      return Divider();
    },
    itemBuilder: (BuildContext context, int index) {
      return buildLocation(locations[index]);
    }
  );
}

Widget buildLocation(String locationName) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          SizedBox(height: 75.0, width: 5.0),
          Text(
            locationName,
            style: TextStyle(
              color: Colors.grey[950],
              fontFamily: 'Montserrat',
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            )
          )
        ]
      ),
      IconButton(
        icon: Icon(Icons.arrow_forward_ios),
        color: Colors.grey[600],
        onPressed: () {}
      ),
    ],
  );
}

// White on green text
/*
Padding(
  padding: EdgeInsets.only(left: 40.0),
  child: Row(
    children: <Widget>[
      Text('Locations',
        style: TextStyle(
        //fontFamily: 'Montserrat',
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 25.0)
      ),
    ],
  ),
),
*/