import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vidacoletiva/controllers/user_controller.dart';
import 'package:vidacoletiva/data/models/project_model.dart';
import 'package:vidacoletiva/data/services/project_service.dart';

import '../data/models/media_model.dart';

class ProjectController extends ChangeNotifier {
  ProjectService projectService;
  UserController? userController;
  BuildContext context;

  ProjectController(this.context, this.projectService, this.userController);

  ProjectModel? project;
  List<ProjectModel> projects = [];

  File? selectedImage;
  CreateMedia? createMedia;
  TextEditingController nameController = TextEditingController();
  TextEditingController institutionController = TextEditingController();
  TextEditingController targetController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isOpen = false;
  GlobalKey<FormState> createProjectFormKey = GlobalKey<FormState>();


  init() async {
    await listProjects();
  }

  Future pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;

    File f = File(returnedImage.path);

    selectedImage = f;
    notifyListeners();

    createMedia = CreateMedia(f, f.path.split('.').last);
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

  Future createProject(BuildContext context) async {
    if (createProjectFormKey.currentState == null || !createProjectFormKey.currentState!.validate()) return;
    if (createMedia == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Selecione uma imagem'),
        ),
      );
      return;
    }
    String name = nameController.text;
    String institution = institutionController.text;
    String target = targetController.text;
    String description = descriptionController.text;
    bool isOpen = this.isOpen;
    
    ProjectModel p = await projectService.addProject(
        ProjectModel(
          name: name,
          institution: institution,
          description: description,
          target: target,
          isOpen: isOpen,
        ),
        createMedia
    );
    projects.add(p);
    notifyListeners();
  }

  void setIsOpen(bool open) {
    isOpen = open;
    notifyListeners();
  }
}
