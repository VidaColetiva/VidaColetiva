import 'package:cloud_firestore/cloud_firestore.dart';

class BlacklistEntry {
  String? id;
  String? userID;
  DateTime? createdAt;

  BlacklistEntry({
    this.id,
    this.userID,
    this.createdAt
  });

  factory BlacklistEntry.fromQueryDocumentSnapshot(
    QueryDocumentSnapshot<Map<String, dynamic>> queryDocumentSnapshot
  ) {
    var data = queryDocumentSnapshot.data();
    return BlacklistEntry(
      id: queryDocumentSnapshot.id,
      userID: data["user_id"],
      createdAt: (data["created_at"] as Timestamp).toDate()
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user_id": userID,
      "created_at": createdAt
    };
  }
}