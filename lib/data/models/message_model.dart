import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String? id;
  String? title;
  String? body;
  DateTime? createdAt;
  String? fromId;
  String? fromEmail;
  String? fromName;
  String? toId;
  String? path;

  MessageModel.fromQueryDocumentSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    id = documentSnapshot.id;
    var data = documentSnapshot.data();
    title = data['title'];
    body = data['body'];
    createdAt = (data['created_at'] as Timestamp).toDate();
    fromId = data['from'];
    fromEmail = data['from_email'];
    fromName = data['from_name'];
    toId = data['to'];
    path = documentSnapshot.reference.path; 
  }
}