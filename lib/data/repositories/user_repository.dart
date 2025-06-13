import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vidacoletiva/data/models/user_model.dart';

class UserRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  UserRepository();

  Future<UserModel> getSelf() async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc('/users/${_firebaseAuth.currentUser!.uid}');
    var user = documentReference
        .get()
        .then((value) => UserModel.fromJson(value.data()!));
    return user;
  }

  Future<UserModel> createSelf() async {
    DocumentReference<Map<String,dynamic>> documentReference = FirebaseFirestore.instance
        .doc('/users/${FirebaseAuth.instance.currentUser!.uid}');
    DocumentSnapshot<Map<String,dynamic>> documentSnapshot = await documentReference.get();
    if (documentSnapshot.exists) {
      return UserModel.fromJson(documentSnapshot.data()!);
    } else {
      documentReference.set({
        'created_at': DateTime.now(),
        'updated_at': DateTime.now(),
        'email': FirebaseAuth.instance.currentUser!.email,
      });
      return UserModel.fromJson({'email': FirebaseAuth.instance.currentUser!.email});
    }
  }

  Future<bool> getIsSuperAdmin() async {
    DocumentReference<Map<String, dynamic>> documentReference = _firebaseFirestore
        .doc('/users/${_firebaseAuth.currentUser!.uid}/private/private');
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await documentReference.get();
    if (documentSnapshot.exists) {
      return documentSnapshot.data()!['isSuperAdmin'] ?? false;
    }
    return false;
  }

  Future<void> updateUser(Map<String, dynamic> data) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc('/users/${_firebaseAuth.currentUser!.uid}');
    await documentReference.update(data);
  }
}
