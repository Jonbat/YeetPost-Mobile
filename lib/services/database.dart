import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yeetpost/models/upvoteFlagData.dart';
import 'package:yeetpost/models/yeetModel.dart';

class DatabaseService {

  final CollectionReference yeetCollection = Firestore.instance.collection('yeets');
  final CollectionReference locationCollection = Firestore.instance.collection('locations');
  final CollectionReference userCollection = Firestore.instance.collection('users');

  void writeYeet(String location, String author, String yeetText) {
    yeetCollection.document().setData({
      'author' : author,
      'location' : location,
      'text' : yeetText,
      'time' : Timestamp.now(),
      'upvotes' : 0,
      'flags' : 0,
    });
  }

  Stream<UpvoteFlagData> getUpvoteData(String userId, String yeetId) {
    // User:
      // upvotes: all ids of yeets that have been upvoted
      // flags: all ids of yeets that have been flagged

      // ... or ...

      // upvoteFlagData: upvoteFlagData (chosen)
        // - upvoted: true/false
        // - flagged: true/false
    return
    userCollection.document(userId).collection('upvoteFlagData').document(yeetId).snapshots().map((doc) {
      if (doc.data == null) {
        return UpvoteFlagData(
          upvoted: false,
          flagged: false,
        );
      } else {
        return UpvoteFlagData(
          upvoted: doc.data['upvoted'] ?? false,
          flagged: doc.data['flagged'] ?? false,
        );
      }
    });
    
  }

  void upvoteYeet(String userId, String yeetId) {
    userCollection.document(userId).collection('upvoteFlagData').document(yeetId).setData({
      'upvoted' : true,
    });
    yeetCollection.document(yeetId).updateData({'upvotes' : FieldValue.increment(1)});
  }
  void unUpvoteYeet(String userId, String yeetId) {
    userCollection.document(userId).collection('upvoteFlagData').document(yeetId).setData({
      'upvoted' : false,
    });
    yeetCollection.document(yeetId).updateData({'upvotes' : FieldValue.increment(-1)});
  }

  void flagYeet(String userId, String yeetId) {
    userCollection.document(userId).collection('upvoteFlagData').document(yeetId).setData({
      'flagged' : true,
    });
    yeetCollection.document(yeetId).updateData({'flags' : FieldValue.increment(1)});
  }
  void unFlagYeet(String userId, String yeetId) {
    userCollection.document(userId).collection('upvoteFlagData').document(yeetId).setData({
      'flagged' : false,
    });
    yeetCollection.document(yeetId).updateData({'flags' : FieldValue.increment(-1)});
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

  Stream<List<YeetModel>> getLocationYeets(String location) {
    return 
    yeetCollection.where('location', isEqualTo: location).snapshots()
      .map(_locationYeetsFromSnapshot);
  }
  List<YeetModel> _locationYeetsFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return YeetModel(
        author: doc.data['author'],
        location: doc.data['location'],
        text: doc.data['text'],
        time: doc.data['time'],
        upvotes: doc.data['upvotes'],
        flags: doc.data['flags'],
        yeetId: doc.documentID,
      );
    }).toList();
  }

  Stream<List<YeetModel>> getTrendingYeets() {
    return 
    yeetCollection.orderBy('upvotes', descending: true).limit(5).snapshots()
      .map(_getTrendingYeets);
  }
  List<YeetModel> _getTrendingYeets(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return YeetModel(
        author: doc.data['author'],
        location: doc.data['location'],
        text: doc.data['text'],
        time: doc.data['time'],
        upvotes: doc.data['upvotes'],
        flags: doc.data['flags'],
        yeetId: doc.documentID,
      );
    }).toList();
  }

  Stream<YeetModel> getSingleYeet(String yeetId) { 
    return yeetCollection.document(yeetId).snapshots().map((doc) {
      return YeetModel(
        author: doc['author'],
        location: doc.data['location'],
        text: doc.data['text'],
        time: doc.data['time'],
        upvotes: doc.data['upvotes'],
        flags: doc.data['flags'],
        yeetId: doc.documentID,
      );
    });
  }

  Stream<List<YeetModel>> getReplies(String yeetId) {
    return 
    yeetCollection.document(yeetId).collection('replies').snapshots()
      .map(_repliesFromSnapshot);
  }
  List<YeetModel> _repliesFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return YeetModel(           // replies use the same model as
        author: doc.data['author'],
        text: doc.data['text'],
        time: doc.data['time'],
        upvotes: doc.data['upvotes'],
        flags: doc.data['flags'],
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