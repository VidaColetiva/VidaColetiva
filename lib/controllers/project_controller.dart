import 'package:flutter/material.dart';
import 'package:vidacoletiva/data/models/project_model.dart';
import 'package:vidacoletiva/data/services/project_service.dart';

class ProjectController extends ChangeNotifier {
  ProjectService projectService;

  ProjectController(this.projectService);

  ProjectModel? project;
  List<ProjectModel> projects = [];

  init() async {
    await listProjects();
  }

  Future listProjects() async {
    projects = await projectService.listProjects();
    debugPrint('events: ${projects.length}');
    notifyListeners();
  }

  selectedProject(ProjectModel project) {
    this.project = project;
    notifyListeners();
  }
}
