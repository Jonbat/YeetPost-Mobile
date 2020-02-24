import 'package:flutter/material.dart';
import 'yeet.dart';
import 'reply.dart';

class ReplyPage extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Replies'),
          elevation: 0.0, // no shadow
          backgroundColor: Color(0xFF21BFBD),
      ),
      backgroundColor: Colors.white,
      body: ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: Column(
            children: <Widget>[
              Yeet("Reply Yeet", true),
              SizedBox(height: 15,)
            ],
          ),
        ),
        Reply().buildReplies(replyList),
        replyComposer()
      ],
      )
    );
  }
}

// Reply composer: chat UI video 59:00

Widget replyComposer() {
  return Text("Reply Composer");
}

List<String> replyList = ["First reply", "A second reply", "Now this is a third reply", "Fourth", ];

