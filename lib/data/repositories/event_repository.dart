import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vidacoletiva/data/models/event_model.dart';

class EventRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<List<EventModel>> listMyEvents() async {
    if (_firebaseAuth.currentUser == null) return [];
    return _firebaseFirestore
        .collection('events')
        .where('user_id', isEqualTo: _firebaseAuth.currentUser!.uid)
        .get()
        .then((value) =>
            value.docs.map(EventModel.fromQueryDocSnapshot).toList());
  }

  Future<List<EventModel>> listAllOnProject(String projectId) async {
    return _firebaseFirestore
        .collection('events')
        .where('project_id', isEqualTo: projectId)
        .get()
        .then((value) =>
            value.docs.map(EventModel.fromQueryDocSnapshot).toList());
  }

  Future<EventModel> create(EventModel event) async {
    event.userID = _firebaseAuth.currentUser!.uid;
    event.createdAt = DateTime.now();
    var doc = await _firebaseFirestore.collection('events').add(event.toJson());

    event.id = doc.id;
    return event;
  }
}
