import 'yeetPage.dart';
import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: Container(
        alignment: Alignment.topCenter,
        //  - Add gradient? linear with appbar
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(60.0)),//75
        ),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 50, top: 20, bottom: 20),
              child: Text(
                'Locations',
                style: TextStyle(
                  //fontFamily: 'Montserrat',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0
                )
              ),
            ),
            buildLocations(context)
          ],
        )
      )
    );
  }
}

List<String> locations = ["SAU", "Duck", "Banana", "ChickenDuck", "Cow", "Frog", "Fish", "dog" , "dog", "dog", "dog", "dog"];

Widget buildLocations(context) {
  return ListView.separated(
    physics: ScrollPhysics(),
    padding: EdgeInsets.only(left: 50, right: 50),
    shrinkWrap: true,
    itemCount: locations.length,
    separatorBuilder: (context, index) {
      return Divider();
    },
    itemBuilder: (BuildContext context, int index) {
      return buildLocation(context, locations[index]);
    }
  );
}

Widget buildLocation(context, String locationName) {
  return InkWell(
    onTap: () { 
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => YeetPage(locationName))
        );
      print(locationName);
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(height: 75.0, width: 5.0,),
            Text(
              locationName,
              style: TextStyle(
                color: Colors.grey[950],
                fontFamily: 'Montserrat',
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              )
            )
          ]
        ),
        Icon(Icons.arrow_forward_ios, color: Colors.grey[600]),
      ],
    ),
  );
}