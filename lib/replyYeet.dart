import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yeetpost/models/yeetModel.dart';
import 'package:yeetpost/services/database.dart';
import 'customTextBox.dart';
import 'package:flutter/material.dart';
import 'custom_icons.dart';

class ReplyYeet extends StatefulWidget {
  String location, yeetId;
  ReplyYeet(this.location, this.yeetId);
  @override
  State<StatefulWidget> createState() {
    return ReplyYeetState(location, yeetId);
  }
}

class ReplyYeetState extends State<ReplyYeet> {
  bool flagPressed, upvotePressed = false;
  String location, yeetId;
  ReplyYeetState(location, yeetId);

  Widget build(BuildContext context) {
    return StreamBuilder<YeetModel> (
      stream: DatabaseService().getSingleYeet(location, yeetId),
      builder: (context, yeetData) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [        
            makeText(yeetData.data),
            makeUpvotes(yeetData.data)
          ],
        );
      }
    );
  }

  Widget makeText(yeetData) {
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
            Icon(Icons.message, size: 30, color: Colors.grey[500]),
            SizedBox(width: 5.0),
            // calculate number of replies? - use cloud functions that update counter for number of replies?
            //  - Text("5", style: TextStyle(fontSize: 16, color: Colors.grey[500]),),
            SizedBox(width: 90.0),
            Text(       // calculate time
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
      children: [
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