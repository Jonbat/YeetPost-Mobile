import 'package:cloud_firestore/cloud_firestore.dart';

class YeetModel {
  final String author;
  final String text;
  final Timestamp time;
  final int upvoteCount;
  final int flagCount;
  final String yeetId;

  YeetModel({this.author, this.text, this.time, this.upvoteCount, this.flagCount, this.yeetId,});  
}