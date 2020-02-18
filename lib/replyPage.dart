import 'package:flutter/material.dart';
import 'reply.dart';
import 'yeet.dart';

class ReplyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReplyPage(),
    );
  }
}

class ReplyPage extends StatefulWidget {
  @override
  ReplyPageState createState() => ReplyPageState();
}

class ReplyPageState extends State<ReplyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yeet'),
          elevation: 0.0, // no shadow
          backgroundColor: Color(0xFF21BFBD),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        primary: false,
        padding: EdgeInsets.only(left: 30.0, right: 20.0),
        children: <Widget>[
          Yeet("The yeet to reply to"),
          buildReplies(),
        ],
      ),
    );
  }
}

List<String> replies = ["First reply", "A second reply", "Now this is a third reply", "Fourth", "Fifth Reply"];

Widget buildReplies() {
  return new Column(
    children: replies.map((reply) => new Reply(reply)).toList()
  );
}

