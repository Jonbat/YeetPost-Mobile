import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yeetpost/models/yeetModel.dart';
import 'package:yeetpost/services/database.dart';
import 'customTextBox.dart';
import 'replyPage.dart';
import 'package:flutter/material.dart';
import 'custom_icons.dart';

class LocationYeets extends StatefulWidget {
  final String location;
  LocationYeets(this.location);
  
  @override
  State<StatefulWidget> createState() {
    return LocationYeetsState(location);
  }
}

class LocationYeetsState extends State<LocationYeets> {
  String location;
  bool flagPressed, upvotePressed = false;

  LocationYeetsState(this.location);

  Widget build(BuildContext context) {
    return StreamBuilder<List<YeetModel>> (
      stream: DatabaseService().getLocationYeets(location),
      builder: (context, yeetData) {
        return ListView.separated(
          physics: ScrollPhysics(),
          padding: EdgeInsets.only(left: 40, right: 40),
          shrinkWrap: true,
          itemCount: yeetData.hasData ? yeetData.data.length : 0,
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            //return Yeet(yeetList.data[index]);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [        
                createText(yeetData.data[index]),
                makeUpvotes(yeetData.data[index])
              ],
            );
          }
        );
      }
    );
  }

  Widget createText(yeetData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        SizedBox(height: 20.0),
        Text(yeetData.author, style: TextStyle(fontSize: 16, color: Colors.grey[500]),),
        SizedBox(height: 8.0),
        CustomTextBox(yeetData.text),
        SizedBox(height: 20.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.message, size: 30),
              color: Colors.grey[500],
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => ReplyPage(location, yeetData.yeetId))
                );
              }
            ),
            SizedBox(width: 5.0),
            // calculate number of replies?
            //  - use cloud functions that update counter, Text("5", style: TextStyle(fontSize: 16, color: Colors.grey[500]),),
            SizedBox(width: 90.0),
            Text(
              DatabaseService().formatTime(Timestamp.now().seconds - yeetData.time.seconds), 
              style: TextStyle(fontSize: 16, color: Colors.grey[500]),
            ),
          ],
        ),
      ]
    );
  }

  Widget makeUpvotes(yeetData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(CustomIcons.up_open, size: 25,),
          color: (upvotePressed == true) ? Color(0xFF21BFBD) : Colors.grey[600],
          onPressed: () {
            setState(() {
              if (upvotePressed) {
                upvotePressed = false;
              } else {
                upvotePressed = true;
              }
            });                    
          }
        ),
        Text(yeetData.upvoteCount.toString(), style: TextStyle(fontSize: 20, color: Colors.grey[800],)),
        SizedBox(height: 2.0),
        IconButton(
          icon: Icon(Icons.flag, size: 30,),
          color: (flagPressed == true) ? Colors.red : Colors.grey[600],
          onPressed: () {
            setState(() {
              if (flagPressed == true) {
                flagPressed = false;
              } else {
                flagPressed = true;
              }
            });                    
          }
        ),
      ],
    );
  }
}