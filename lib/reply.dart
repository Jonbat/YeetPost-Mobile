import 'package:flutter/material.dart';
import 'custom_icons.dart';

class Reply extends StatelessWidget {
  final String replyText;
  Reply([this.replyText]);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [        
        makeText(replyText),
        makeUpvotes()
      ],
    );
  }

  Widget makeText(replyText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        SizedBox(height: 30.0, width: 0.0),
        Container(
          width: 275,
          child: Text(
            replyText,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            style: TextStyle(
              fontFamily: 'Montserrat',
              height: 1.15,
              fontSize: 18.0,
            )
          ),
        ),
        SizedBox(height: 30.0, width: 0.0),
        Text("50m", style: TextStyle(fontSize: 16, color: Colors.grey[500]),),
      ]
    );
  }

  Widget makeUpvotes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(CustomIcons.up_open, size: 25,),
          color: Colors.grey[600],
          onPressed: () {}
        ),
        Text("3", style: TextStyle(fontSize: 20, color: Colors.grey[800],)),
        SizedBox(height: 2.0),
        IconButton(
          icon: Icon(Icons.flag, size: 30,),
          color: Colors.grey[600],
          onPressed: () {}
        ),
      ],
    );
  }

  Widget buildReplies(List<String> replies) {
    return ListView.separated(
      physics: ScrollPhysics(),
      padding: EdgeInsets.only(left: 40, right: 40),
      shrinkWrap: true,
      itemCount: replies.length,
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        return Reply(replies[index]);
      }
    );
  }
}