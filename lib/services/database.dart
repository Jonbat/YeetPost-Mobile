import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yeetpost/models/yeet.dart';

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

  List<YeetModel> _yeetListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return YeetModel(
        uid: doc.data['uid'],
        text: doc.data['text'],
        upvotes: doc.data['upvotes'] ?? 0,
        flags: doc.data['flags'] ?? 0,
        replies: doc.data['replies'] ?? 0
      );
    }).toList();
  }

  List<String> _locationListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return doc.documentID.toString();
    }).toList();
  }

  Stream<List<String>> get locations {
    return locationCollection.snapshots()
      .map(_locationListFromSnapshot);
  }

  // write Yeet


  // 1 collection: locations
  //  - locations: contains all yeets from a collection
}