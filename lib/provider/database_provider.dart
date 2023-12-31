import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devTools;

import 'package:provider/provider.dart';
import 'package:study_buddy/helpers/helper_functions.dart';
import 'package:study_buddy/provider/auth_provider.dart';

class DatabaseProvider extends ChangeNotifier {
  static String userId = "";
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  DatabaseProvider() {
    initializeUserId();
  }

  void initializeUserId() async {
    MyAuthProvider ap = MyAuthProvider();
    devTools.log("Inside Initializing user id");
    devTools.log(ap.getUserId ?? "No user ID");
    userId = ap.getUserId ?? " ";
    devTools.log(notesCollection.toString());
  }

  static final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  static final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection("groups");
  static CollectionReference notesCollection =
      userCollection.doc(userId).collection("Notes");

  //Updating the user data
  Future addUserData(
      {required String fullName,
      required String email,
      required String phone}) async {
    _isLoading = true;
    notifyListeners();
    await userCollection.doc(userId).set(
        {"fullName": fullName, "email": email, "phone": phone, "groups": []});
    _isLoading = false;
    notifyListeners();
  }

  Future updateUserData({String? fullName, String? email}) async {}

  //Get User data
  Future<bool> checkUserDataExists() async {
    initializeUserId();
    DocumentSnapshot doc = await userCollection.doc(userId).get();
    notesCollection = userCollection.doc(userId).collection("Notes");
    devTools.log(doc.exists.toString());

    return doc.exists;
  }

  Future<DocumentSnapshot> getUserData() async {
    initializeUserId();
    _isLoading = true;
    notifyListeners();
    DocumentSnapshot userData = await userCollection.doc(userId).get();
    devTools.log(userData.data().toString());
    _isLoading = false;
    notifyListeners();
    return userData;
  }

  //get user groups
  getUserGroups() async {
    return userCollection.doc(userId).snapshots();
  }

  //get notes stream
  Stream<QuerySnapshot> getPinnedNotesStream() {
    return notesCollection.where("is_pinned", isEqualTo: true).snapshots();
  }

  Stream<QuerySnapshot> getUnpinnedNotesStream() {
    return notesCollection.where("is_pinned", isEqualTo: false).snapshots();
  }

  Future<void> addNote({
    required String title,
    required String content,
    required bool isPinned,
  }) async {
    final date = DateTime.now().toString();
    await notesCollection.add({
      "note_title": title,
      "creation_date": date,
      "note_content": content,
      "is_pinned": isPinned,
    });
  }
  Future<void> deleteNote({required String id})async{
    await notesCollection.doc(id).delete();
  }
}
