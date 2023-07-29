import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/models/user_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthHepler {
  static FirebaseAuthHepler instance = FirebaseAuthHepler();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<User?> get getAuthChange => _auth.authStateChanges();

  /* LOGIN */
  Future<bool> login(
      String email, String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();

      return true;
    } on FirebaseAuthException catch (error) {
      Navigator.of(context).pop();
      showMessage(error.code.toString());
      // print(e.toString());
      return false;
    }
  }

  /* SIGNUP */
  Future<bool> signUp(
      String name, String email, String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      UserCredential? userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel userModel = UserModel(
          image: null, name: name, id: userCredential.user!.uid, email: email);

      _firestore.collection("users").doc(userModel.id).set(userModel.toJson());

      Navigator.of(context).pop();

      return true;
    } on FirebaseAuthException catch (error) {
      Navigator.of(context).pop();
      showMessage(error.code.toString());
      // print(e.toString());
      return false;
    }
  }

  void signOut() async {
    await _auth.signOut();
  }

  /* CHANDE PASSWORD */
  Future<bool> changePassword(String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      _auth.currentUser!.updatePassword(password);
      // UserCredential? userCredential = await _auth
      //     .createUserWithEmailAndPassword(email: email, password: password);

      // UserModel userModel = UserModel(
      //     image: null, name: name, id: userCredential.user!.uid, email: email);

      // _firestore.collection("users").doc(userModel.id).set(userModel.toJson());

      Navigator.of(context, rootNavigator: true).pop();
      showMessage("Password Changed");
      Navigator.of(context).pop();

      return true;
    } on FirebaseAuthException catch (error) {
      Navigator.of(context).pop();
      showMessage(error.code.toString());
      // print(e.toString());
      return false;
    }
  }
}
