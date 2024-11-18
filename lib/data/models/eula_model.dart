import 'package:cloud_firestore/cloud_firestore.dart';

class EulaModel{
  String? version;
  String? text;
  bool? iAgreed;
  DateTime? createdAt;

  EulaModel({
    required this.text,
    required this.iAgreed,
    required this.version,
  });

  Map<String, dynamic> toJson(){
    return {"text": text};
  }

  EulaModel.fromJson(Map<String, dynamic> json){
    version = json["id"];
    text = json["text"];
    createdAt = (json["created_at"] as Timestamp).toDate();
    iAgreed = false;
  }
}