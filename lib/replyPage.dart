import 'package:flutter/material.dart';
import 'yeet.dart';
import 'reply.dart';

class ReplyPage extends StatelessWidget {

  final String yeetId;
  ReplyPage(this.yeetId);

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Replies'),
          elevation: 0.0, // no shadow
          backgroundColor: Color(0xFF21BFBD),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 140.0,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: Column(
                      children: <Widget>[
                        Yeet().buildReplyYeet(context, yeetId),
                        SizedBox(height: 15,)
                      ],
                    ),
                  ),
                  Reply().buildReplies(replyList),
                ],
              ),
            ),
            //Divider(),
            SizedBox(height : 5,),
            replyComposer(),
          ],
        )
      )
    );
  }
}

Widget replyComposer() {
  return Container(
    padding: EdgeInsets.only(left: 10, right: 10,),
    height: 50,
    child: Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              labelText: "Reply...",
            ),
            keyboardType: TextInputType.text,
            style: TextStyle(
              fontFamily: "Poppins",
            ),
          ),
        ),
        SizedBox(width: 5),
        IconButton(
          icon: Icon(Icons.send, size: 28),
          color: Color(0xFF21BFBD),
          onPressed: () {
          }
        )
      ],
    )
  );
}

List<String> replyList = ["First reply", "A second reply", "Now this is a third reply", "Fourth", ];
  


