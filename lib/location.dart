import 'locationYeetPage.dart';
import 'package:flutter/material.dart';
import 'services/database.dart';

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

Widget buildLocations(context) {
   return StreamBuilder<List<String>> (
    stream: DatabaseService().locations,
    builder: (context, locationsList) {
      return ListView.separated(
        physics: ScrollPhysics(),
        padding: EdgeInsets.only(left: 50, right: 50),
        shrinkWrap: true,
        itemCount: locationsList.hasData ? locationsList.data.length : 0,
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemBuilder: (context, index) {
          return buildLocationTile(
            context, locationsList.data[index]
          );
        }
      );
    }
  );
}

Widget buildLocationTile(context, String locationName) {
  return InkWell(
    onTap: () { 
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LocationYeetPage(locationName))
      );
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