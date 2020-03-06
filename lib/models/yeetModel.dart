import 'package:cloud_firestore/cloud_firestore.dart';

class YeetModel {
  final String author;
  final String text;
  final Timestamp time;
  final int upvotes;
  final int flags;
  final String yeetId;
  final String location;

  YeetModel({this.author, this.text, this.time, this.upvotes, this.flags, this.yeetId, this.location});  
}