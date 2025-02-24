import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vidacoletiva/data/models/project_model.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ProjectRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<List<ProjectModel>> listProjects() async {
    List<ProjectModel> projectsList = await _firebaseFirestore
        .collection('projects')
        .get()
        .then((value) => value.docs
            .map((e) => ProjectModel.fromQueryDocSnapshot(e))
            .toList());
    return projectsList;
  }

  Future<ProjectModel> createProject(ProjectModel project) async {
    project.ownerId = _firebaseAuth.currentUser!.uid;
    project.createdAt = DateTime.now();

    DocumentReference docRef =
        await _firebaseFirestore.collection('projects').add(project.toJson());

    project.id = docRef.id;

    return project;
  }
}
