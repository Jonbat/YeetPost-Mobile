import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yeetpost/models/yeetModel.dart';
import 'package:yeetpost/services/database.dart';
import 'customTextBox.dart';
import 'custom_icons.dart';
import 'replyPage.dart';
import 'package:flutter/material.dart';

class Yeet {
  String location;
  Yeet([this.location]);

  Widget buildLocationYeets(yeetData) {
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
            //print(yeetData.data[index].upvoteCount);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [        
                createText(context, yeetData.data[index]),
                makeUpvote(yeetData.data[index].upvoteCount)
              ],
            );
          }
        );
      }
    );
  }

  Widget buildTrendingYeets() {
    return StreamBuilder<List<YeetModel>> (
      stream: DatabaseService().getTrendingYeets(),
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
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [        
                createText(context, yeetData.data[index]),
                makeUpvote(yeetData.data[index].upvoteCount)
              ],
            );
          }
        );
      }
    );
  }

  Widget buildReplyYeet(BuildContext context, yeetId) {
    return StreamBuilder<YeetModel> (
      stream: DatabaseService().getSingleYeet(yeetId),
      builder: (context, yeetData) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [        
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                SizedBox(height: 20.0),
                Text(yeetData.data.author, style: TextStyle(fontSize: 16, color: Colors.grey[500]),),
                SizedBox(height: 8.0),
                CustomTextBox(yeetData.data.text),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(Icons.message, size: 30, color: Colors.grey[500]),
                    SizedBox(width: 5.0),
                    SizedBox(width: 90.0),
                    Text(       // calculate time
                      DatabaseService().formatTime(Timestamp.now().seconds - yeetData.data.time.seconds), 
                      style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ]
            ),
            makeUpvote(yeetData.data.upvoteCount)
          ],
        );
      }
    );
  }

  Widget createText(context, yeetData) {
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
                  MaterialPageRoute(builder: (context) => ReplyPage(yeetData.yeetId))
                );
              }
            ),
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

  Widget makeUpvote(upvoteCount)  {
    bool flagPressed, upvotePressed = false;
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) { 
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
            Text(upvoteCount.toString(), style: TextStyle(fontSize: 20, color: Colors.grey[800],)),
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
    );
  }
  
}