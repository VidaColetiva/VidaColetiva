import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectModel {
  String? id;
  String? name;
  String? description;
  String? institution;
  String? target;
  bool? isOpen;
  List managers = [];
  List banned = [];

  ProjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  toJson() {
    Map<String, dynamic> json = {
      "id": id,
      "name": name,
      "description": description,
      "institution": institution,
      "target": target,
      "managers": managers,
      "banned": banned,
      "is_open": isOpen,
    };
    return json;
  }

  ProjectModel.fromQueryDocSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> queryDocumentSnapshot) {
    id = queryDocumentSnapshot.id;
    Map data = queryDocumentSnapshot.data();
    name = data["name"];
    description = data["description"];
    institution = data["institution"];
    target = data["target"];
    managers = data["managers"];
    isOpen = data["is_open"];
    banned = data["banned"] ?? [];

  }

  ProjectModel.fromDocSnapshot(DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    id = documentSnapshot.id;
    Map? data = documentSnapshot.data()!;
    name = data["name"];
    description = data["description"];
    institution = data["institution"];
    target = data["target"];
    managers = data["managers"];
    isOpen = data["is_open"];
    banned = data["banned"] ?? [];
  }

}