import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vidacoletiva/data/models/project_model.dart';
import 'package:vidacoletiva/data/repositories/project_repository.dart';

class ProjectService {
  final ProjectRepository _projectRepository;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  ProjectService(this._projectRepository);

  Future<List<ProjectModel>> listProjects() async {
    return _projectRepository.listProjects();
  }
}
