import 'package:flutter/material.dart';
import 'package:yeetpost/services/database.dart';
import 'models/yeetModel.dart';
import 'yeet.dart';
import 'reply.dart';

class ReplyPage extends StatelessWidget {

  final String location, yeetId, author;
  ReplyPage(this.location, this.yeetId, this.author,);

  final _formkey = GlobalKey<FormState>();

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Replies'),
          elevation: 0.0, // no shadow
          backgroundColor: Color(0xFF21BFBD),
      ),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 135.0,
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: Column(
                        children: <Widget>[
                          Yeet().buildReplyYeet(yeetId),
                          SizedBox(height: 15,),
                          Divider(),
                          SizedBox(height: 5,),
                        ],
                      ),
                    ),
                    buildReplies(),
                  ],
                ),
              ),
              replyComposer(),
            ],
          )
        ),
      )
    );
  }

  Widget replyComposer() {
    String replyText;
    final TextEditingController _controller = new TextEditingController();
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Form(
          key: _formkey,
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10,),
            height: 50,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    controller: _controller,
                    textCapitalization: TextCapitalization.sentences,
                    maxLength: 150,
                    decoration: InputDecoration(
                      labelText: "Reply",
                      counterText: "",
                    ),
                    validator: (val) => val.isEmpty ? 'Please enter a reply' : null,
                    onChanged: (val) {
                      setState(() => replyText = val);
                    }
                  ),
                ),
                SizedBox(width: 5),
                IconButton(
                  icon: Icon(Icons.send, size: 28),
                  color: Color(0xFF21BFBD),
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      DatabaseService().writeReply(yeetId, author, replyText);
                      FocusScope.of(context).requestFocus(new FocusNode());
                      _controller.clear();
                    }
                  },
                )
              ],
            )
          ),
        );
      }
    );
  }

  Widget buildReplies() {
    return StreamBuilder<List<YeetModel>> (
      stream: DatabaseService().getReplies(yeetId),
      builder: (context, replies) {
        return ListView.separated(
          physics: ScrollPhysics(),
          padding: EdgeInsets.only(left: 40, right: 40),
          shrinkWrap: true,
          itemCount: replies.hasData ? replies.data.length : 0,
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            return Reply(replies.data[index]);
          }
        );
      }
    );
  }
  
}
  


