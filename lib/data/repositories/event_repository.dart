import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vidacoletiva/data/models/event_model.dart';

class EventRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<List<EventModel>> listMyEvents() async {
    return _firebaseFirestore
        .collection('events')
        .where('user_id', isEqualTo: _firebaseAuth.currentUser!.uid)
        .get()
        .then((value) =>
            value.docs.map(EventModel.fromQueryDocSnapshot).toList());
  }

  Future<EventModel> create(EventModel event) async {
    var doc = await FirebaseFirestore.instance
        .collection('events')
        .add(event.toJson());

    event.id = doc.id;
    return event;
  }
}
