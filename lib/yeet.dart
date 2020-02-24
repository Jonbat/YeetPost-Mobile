import 'package:first_app/customTextBox.dart';
import 'package:first_app/replyPage.dart';
import 'package:flutter/material.dart';
import 'custom_icons.dart';

class Yeet extends StatefulWidget {
  final String yeetText;
  final bool disableReplyButton;
  Yeet([this.yeetText, this.disableReplyButton]);
  @override
  State<StatefulWidget> createState() {
    return YeetState(yeetText, disableReplyButton);
  }

  Widget buildYeets(List<String> yeets) {
    return ListView.separated(
      physics: ScrollPhysics(),
      padding: EdgeInsets.only(left: 40, right: 40),
      shrinkWrap: true,
      itemCount: yeets.length,
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        return Yeet(yeets[index], false);
      }
    );
  }
}

class YeetState extends State<Yeet> {
  final String yeetText;
  final bool disableReplyButton;
  bool flagPressed, upvotePressed = false;

  YeetState([this.yeetText, this.disableReplyButton]);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [        
        createText(context, yeetText, disableReplyButton),
        makeUpvotes()
      ],
    );
  }

  Widget createText(context, yeetText, bool disableReplyButton) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        SizedBox(height: 20.0),
        Text("Anonymous", style: TextStyle(fontSize: 16, color: Colors.grey[500]),),
        SizedBox(height: 5.0),
        CustomTextBox(yeetText),
        SizedBox(height: 20.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            makeReplyIcon(context, disableReplyButton),
            SizedBox(width: 5.0),
            Text("5", style: TextStyle(fontSize: 16, color: Colors.grey[500]),),
            SizedBox(width: 90.0),
            Text("50m", style: TextStyle(fontSize: 16, color: Colors.grey[500]),),
          ],
        ),
      ]
    );
  }

  Widget makeReplyIcon(context, disableReplyButton) {
    if (disableReplyButton) { 
      return Icon(Icons.message, size: 30, color: Colors.grey[500]);
    } else {
      return IconButton(
        icon: Icon(Icons.message, size: 30),
        color: Colors.grey[500],
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => ReplyPage())
          );
        }
      );
    }
  }

  Widget makeUpvotes() {
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
        Text("3", style: TextStyle(fontSize: 20, color: Colors.grey[800],)),
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