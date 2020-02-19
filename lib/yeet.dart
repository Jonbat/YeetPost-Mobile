import 'package:first_app/replyPage.dart';
import 'package:flutter/material.dart';
import 'custom_icons.dart';

class Yeet extends StatelessWidget {
  final String yeetText;
  Yeet([this.yeetText]);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [        
        createText(yeetText, context),
        makeUpvotes()
      ],
    );
}

/*
Widget buildYeets(List<String> yeets) {
  return new Column(
    children: yeets.map((yeet) => new Yeet(yeet)).toList()
  );
}
*/

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
      return Yeet(yeets[index]);
    }
  );
}

Widget createText(yeetText, context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:[
      SizedBox(height: 30.0),
      Container(
        width: 275,
        child: Text(
          yeetText,
          overflow: TextOverflow.ellipsis,
          maxLines: 5,
          style: TextStyle(
            fontFamily: 'Montserrat',
            height: 1.15,
            fontSize: 18.0,
          )
        ),
      ),
      SizedBox(height: 30.0,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.message, size: 30),
            color: Colors.grey[500],
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => ReplyPage())
              );
            }
          ),
          SizedBox(width: 5.0),
          Text("5", style: TextStyle(fontSize: 16, color: Colors.grey[500]),),
          SizedBox(width: 90.0),
          Text("50m", style: TextStyle(fontSize: 16, color: Colors.grey[500]),),
        ],
      ),
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

Widget makeLikeButton({isActive}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey[200]),
      borderRadius: BorderRadius.circular(50),
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.thumb_up, color: isActive ? Colors.blue : Colors.grey, size: 18,),
          SizedBox(width: 5,),
          Text("Like", style: TextStyle(color: isActive ? Colors.blue : Colors.grey),)
        ],
      ),
    ),
  );
  }
}