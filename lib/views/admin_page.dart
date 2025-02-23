import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidacoletiva/controllers/project_controller.dart';
import 'package:vidacoletiva/data/models/project_model.dart';
import 'package:vidacoletiva/resources/widgets/add_app_bar.dart';

class AdminPage extends StatelessWidget {
  AdminPage({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: addAppBar(context, "Administração"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("Projetos", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            projectList(context),
          ],
        ),
      ),
    );
  }

  Widget projectList(BuildContext context) {
    ProjectController projectController = Provider.of<ProjectController>(context);
    List<Widget> projects = projectController.projects.map((p) => projectWidget(context, p)).toList();
    return Column(
      children: projects,
    );
  }

  Widget projectWidget(BuildContext context, ProjectModel project) {
    return GestureDetector(
      onTap: () {
        Provider.of<ProjectController>(context, listen: false).selectedProject(project);
        Navigator.pushNamed(context, "/project");
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          title: Text(project.name ?? ""),
          subtitle: Text(project.description ?? ""),
          // trailing: IconButton(
          //   icon: const Icon(Icons.edit),
          //   onPressed: () {
          //     // Add your edit functionality here
          //   },
          // ),
        ),
      ),
    );
  }
}