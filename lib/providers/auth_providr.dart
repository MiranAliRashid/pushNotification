import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:psuhnotifcation/models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  UserModel? theUser;

  String? name;

  void setTheUserName(String theUserName) {
    debugPrint(theUserName);
    name = theUserName;
    notifyListeners();
  }

  void setTheGUser(UserModel theUserModel) {
    theUser = theUserModel;
    notifyListeners();
  }

  Future<void> addtheUserToTheDatabase(UserModel gUser) async {
    await _firestore
        .collection('users')
        .doc(gUser.uid)
        .set(gUser.toMap(), SetOptions(merge: true));

    setTheGUser(gUser);
  }

  //make a function to generate a token from firebasemessaging and return it as a string
  getToken() async {
    return await _firebaseMessaging
        .getToken()
        .catchError((error, stackTrace) => debugPrint(error.toString()));
  }

  //singin anonymously
  Future<void> signInAnonymously() async {
    try {
      await _auth.signInAnonymously().then((value) {
        _firebaseMessaging.getToken().then((token) {
          _firestore.collection('users').doc(value.user!.uid).set({
            "uid": value.user!.uid,
            "name": "Anonymous",
            "token": token,
          }, SetOptions(merge: true));
        });
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //loout the user
  Future<void> signOut() async {
    await _auth.signOut();
    theUser = null;
    notifyListeners();
  }

  //get the list of all users from firebase
  Future<List<UserModel>> getAllUsers() async {
    List<UserModel> users = [];
    await _firestore.collection('users').get().then((value) {
      value.docs.forEach((element) {
        users.add(UserModel.fromMap(element.data()));
      });
    });
    return users;
  }

  // check if the user logged in or not
  Future<bool> isLoggedIn() async {
    final _currentUser = _auth.currentUser;
    if (_currentUser != null) {
      return true;
    } else {
      return false;
    }
  }
}
