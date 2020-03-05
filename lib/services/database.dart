import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yeetpost/models/yeetModel.dart';

class DatabaseService {

  // collection reference
  final CollectionReference locationCollection = Firestore.instance.collection('locations');

  void writeYeet(String location, String author, String yeetText) {
    locationCollection.document(location).collection('yeets').document().setData({
      'author' : author,
      'text' : yeetText,
      'time' : Timestamp.now(),
      'upvoteCount' : 0,
      'flagCount' : 0,
    });
  }

  Stream<List<String>> get locations {
    return locationCollection.snapshots()
      .map(_locationListFromSnapshot);
  }

  List<String> _locationListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return doc.documentID.toString();
    }).toList();
  }

  Stream<List<YeetModel>> getYeets(String location) {
    return 
    locationCollection.document(location).collection('yeets').snapshots()
      .map(_yeetListFromSnapshot);
  }

  List<YeetModel> _yeetListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return YeetModel(
        author: doc.data['author'],
        text: doc.data['text'],
        time: doc.data['time'],
        upvoteCount: doc.data['upvoteCount'],
        flagCount: doc.data['flagCount'],
        yeetId: doc.documentID,
      );
    }).toList();
  }

  Stream<YeetModel> getSingleYeet(String location, String yeetId) { 
    return locationCollection.document(location).collection('yeets').document().snapshots().map((doc) {
      return YeetModel(
        author: doc.data['author'],
        text: doc.data['text'],
        time: doc.data['time'],
        upvoteCount: doc.data['upvoteCount'],
        flagCount: doc.data['flagCount'],
      );
    });
  }

  Stream<List<YeetModel>> getReplies(String location) {
    return 
    locationCollection.document(location).collection('yeets').snapshots()
      .map(_yeetListFromSnapshot);
  }

  List<YeetModel> _repliesFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return YeetModel(           // replies use the same model as
        author: doc.data['author'],
        text: doc.data['text'],
        time: doc.data['time'],
        upvoteCount: doc.data['upvoteCount'],
        flagCount: doc.data['flagCount'],
      );
    }).toList();
  }

  String formatTime(num totalseconds) {
    if (totalseconds > 3600) {
      return (totalseconds ~/ 3600).toString() + 'h';
    } else if (totalseconds > 60) {
      return ((totalseconds ~/ 60) % 60).toString() + 'm';
    } else {
      return totalseconds.round().toString() + 's';
    }
  }

  /*
  Two collections: 
    Trending: Order yeets by upvote, limit to 10
    LocationPage: Query all yeets where location == ''

  One collection:
    Trending: Get all yeets from all locations, order by upvote and limit to 10

  */

}