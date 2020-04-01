import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeetpost/models/yeetModel.dart';
import 'package:yeetpost/services/database.dart';
import 'custom_icons.dart';
import 'loadingIcon.dart';
import 'models/upvoteFlagData.dart';
import 'models/user.dart';

class Reply extends StatelessWidget {
  final YeetModel replyData;
  Reply(this.replyData);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [        
        makeText(),
        makeUpvote(context)
      ],
    );
  }

  Widget makeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        SizedBox(height: 10.0),
        Text(replyData.author, style: TextStyle(fontSize: 16, color: Colors.grey[500]),),
        SizedBox(height: 10.0, width: 0.0),
        Container(
          width: 275,
          child: Text(
            replyData.text,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            style: TextStyle(
              fontFamily: 'Montserrat',
              height: 1.15,
              fontSize: 18.0,
            )
          ),
        ),
        SizedBox(height: 30,),
        Text(DatabaseService().formatTime(Timestamp.now().seconds - replyData.time.seconds), 
          style: TextStyle(fontSize: 16, color: Colors.grey[500]),
        ),
      ]
    );
  }

  Widget makeUpvote(context)  {
    final user = Provider.of<User>(context);
    return StreamBuilder<UpvoteFlagData> (
      stream: DatabaseService().getReplyUpvoteData(user.uid, replyData.yeetId, replyData.replyId),
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
                  DatabaseService().unUpvoteReply(user.uid, replyData.yeetId, replyData.replyId); // Un-upvote
                } else {
                  print(user.uid);
                  DatabaseService().upvoteReply(user.uid, replyData.yeetId, replyData.replyId); // Upvote
                }                
              }
            ) : LoadingIcon(30),
            Text(replyData.upvotes.toString(), style: TextStyle(fontSize: 20, color: Colors.grey[800],)),
            SizedBox(height: 2.0),
            upvoteFlagData.hasData ? IconButton(
              icon: Icon(Icons.flag, size: 30,),
              color: (upvoteFlagData.data.flagged == true) ? Colors.red : Colors.grey[600],
              onPressed: () {
                if (upvoteFlagData.data.flagged == true) {
                  print('unflagged');
                  DatabaseService().unFlagReply(user.uid, replyData.yeetId, replyData.replyId); // Un-flag
                } else {
                  print('flagged');
                  DatabaseService().flagReply(user.uid, replyData.yeetId, replyData.replyId); // Flag
                }                 
              }
            ) : LoadingIcon(30)
          ],
        );
      }
    );
  }

}