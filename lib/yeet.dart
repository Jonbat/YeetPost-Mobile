import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:yeetpost/models/yeetModel.dart';
import 'package:yeetpost/services/database.dart';
import 'customTextBox.dart';
import 'custom_icons.dart';
import 'models/upvoteFlagData.dart';
import 'models/user.dart';
import 'replyPage.dart';
import 'package:flutter/material.dart';
import 'loadingIcon.dart';

class Yeet {
  Widget buildLocationYeets(String location) {
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
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [        
                createText(context, yeetData.data[index],),
                makeUpvote(context, yeetData.data[index].upvotes, yeetData.data[index].yeetId,)
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
                makeUpvote(context, yeetData.data[index].upvotes, yeetData.data[index].yeetId,)
              ],
            );
          }
        );
      }
    );
  }

  Widget buildReplyYeet(yeetId) {
    return StreamBuilder<YeetModel> (
      stream: DatabaseService().getSingleYeet(yeetId),
      builder: (context, yeetData) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [        
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: yeetData.hasData ? [
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
              ] : [LoadingIcon(30)]
            ),
            yeetData.hasData ? makeUpvote(context, yeetData.data.upvotes, yeetData.data.yeetId,) : LoadingIcon(15)
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
                  MaterialPageRoute(builder: (context) => ReplyPage(yeetData.location, yeetData.yeetId, yeetData.author,))
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

  Widget makeUpvote(BuildContext context, upvotes, yeetId)  {
    final user = Provider.of<User>(context);
    return StreamBuilder<UpvoteFlagData> (
      stream: DatabaseService().getYeetUpvoteData(user.uid, yeetId),
      builder: (context, upvoteFlagData) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            upvoteFlagData.hasData ? IconButton(
              icon: Icon(CustomIcons.up_open, size: 25,),
              color: (upvoteFlagData.data.upvoted == true) ? Color(0xFF21BFBD) : Colors.grey[600],
              onPressed: () {
                if (upvoteFlagData.data.upvoted == true) {
                  print(user.uid);
                  DatabaseService().unUpvoteYeet(user.uid, yeetId); // Un-upvote
                } else {
                  print(user.uid);
                  DatabaseService().upvoteYeet(user.uid, yeetId); // Upvote
                }                
              }
            ) : LoadingIcon(30),
            Text(upvotes.toString(), style: TextStyle(fontSize: 20, color: Colors.grey[800],)),
            SizedBox(height: 2.0),
            upvoteFlagData.hasData ? IconButton(
              icon: Icon(Icons.flag, size: 30,),
              color: (upvoteFlagData.data.flagged == true) ? Colors.red : Colors.grey[600],
              onPressed: () {
                if (upvoteFlagData.data.flagged == true) {
                  print('unflagged');
                  DatabaseService().unFlagYeet(user.uid, yeetId); // Un-flag
                } else {
                  print('flagged');
                  DatabaseService().flagYeet(user.uid, yeetId); // Flag
                }                 
              }
            ) : LoadingIcon(30)
          ],
        );
      }
    );
  }
  
}