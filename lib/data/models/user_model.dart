import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vidacoletiva/data/models/event_model.dart';

class UserModel {
  String? id;
  String? email;
  String? gender;
  String? race;
  String? occupation;
  int? county;
  String? state;
  DateTime? bornAt;
  late bool isAdmin;
  List<EventModel>? events;
  List<String>? acceptedEulas;

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    gender = json['gender'];
    race = json['race'];
    occupation = json['occupation'];
    county = json['county'];
    state = json['state'];
    isAdmin = json['is_admin'] ?? false;
    if (json['born_at'] != null) {
      bornAt = (json['born_at'] as Timestamp).toDate();
    }
    acceptedEulas = json['accepted_eulas'];
  }

  UserModel.fromQueryDocumentSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> queryDocumentSnapshot) {
    var json = queryDocumentSnapshot.data();

    id = queryDocumentSnapshot.id;
    email = json['email'];
    gender = json['gender'];
    race = json['race'];
    occupation = json['occupation'];
    county = json['county'];
    state = json['state'];
    isAdmin = json['is_admin'] ?? false;
    if (json['born_at'] != null) {
      bornAt = (json['born_at'] as Timestamp).toDate();
    }
    acceptedEulas = json['accepted_eulas'];
  }

  toJson() {
    Map<String, dynamic> json = {
      "email": email,
      "race": race,
      "occupation": occupation,
      "state": state,
      "county": county,
      "gender": gender,
      "born_at": bornAt.toString()
    };
    return json;
  }

  @override
  String toString() {
    return "User(email: $email, gender: $gender)";
  }
}
