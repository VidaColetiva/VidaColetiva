import 'package:flutter/material.dart';
import 'package:vidacoletiva/controllers/user_controller.dart';
import 'package:vidacoletiva/data/models/project_model.dart';
import 'package:vidacoletiva/data/services/project_service.dart';

import '../data/models/media_model.dart';

class ProjectController extends ChangeNotifier {
  ProjectService projectService;
  UserController? userController;

  ProjectController(this.projectService, this.userController);

  ProjectModel? project;
  List<ProjectModel> projects = [];

  init() async {
    await listProjects();
  }

  Future listProjects() async {
    debugPrint("isAdmin: ${userController?.isSuperAdmin}");
    projects = await projectService.listProjects(isAdmin: userController?.isSuperAdmin ?? false);
    debugPrint('events: ${projects.length}');
    notifyListeners();
  }

  selectedProject(ProjectModel project) {
    this.project = project;
    notifyListeners();
  }

  Future createProject(String name, String institution, String target, String description, CreateMedia? image, bool isOpen) async {
    ProjectModel p = await projectService.addProject(
        ProjectModel(
          name: name,
          institution: institution,
          description: description,
          target: target,
          isOpen: isOpen,
        ),
        image
    );
    projects.add(p);
    notifyListeners();
  }
}
