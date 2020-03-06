import 'package:firebase_auth/firebase_auth.dart';
import 'package:yeetpost/models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // change display name
  void changeDisplayName(String name) {
    var user = _auth.currentUser();
    user.then((currentUser) {
      UserUpdateInfo updateUser = UserUpdateInfo();
      updateUser.displayName = name;
      currentUser.updateProfile(updateUser);
    });
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
      //.map((FirebaseUser user) => _userFromFireBaseUser(user));
      .map(_userFromFireBaseUser);
  }
  User _userFromFireBaseUser(FirebaseUser user) {
    if (user != null) {
      return User(
        user.uid,
        user.displayName ?? 'Anonymous'
      );
    } else {
      return null;
    }
  }

  // sign in anonymously
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFireBaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFireBaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFireBaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // sign out anonymously
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

}