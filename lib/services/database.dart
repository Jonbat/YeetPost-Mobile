import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  // collection reference
  final CollectionReference locationCollection = Firestore.instance.collection('locations');

  // 2 collections: yeets and locations
  //  - yeets: author, text, time, replies, upvotes, and flags
  //  - locations: has references to all the yeets that are part of it
  //  - link yeets with locations using ids?
}