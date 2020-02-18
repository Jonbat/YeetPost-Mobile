import 'package:flutter/material.dart';
import 'custom_icons.dart';

class Reply extends StatelessWidget {
  final String replyText;
  Reply(this.replyText);

  @override
  Widget build(BuildContext context) {
    return Column( 
      children: [
        Divider(),
        Padding(
          padding: EdgeInsets.only(left: 0.0, right: 5.0, top: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [        
              createText(replyText),
              makeUpvotes()
            ],
          ),  
        )
      ]
  );
}

Widget createText(yeetText) {
  return Column(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          SizedBox(height: 30.0, width: 0.0),
          Container(
            width: 270,
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
          SizedBox(height: 25.0, width: 0.0),
          Text("50m", style: TextStyle(fontSize: 16, color: Colors.grey[500]),),
        ]
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