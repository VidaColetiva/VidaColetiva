import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidacoletiva/controllers/event_controller.dart';
import 'package:vidacoletiva/controllers/project_controller.dart';
import 'package:vidacoletiva/controllers/user_controller.dart';
import 'package:vidacoletiva/resources/widgets/main_app_bar.dart';

import '../resources/assets/colour_pallete.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    final ProjectController projectController =
        Provider.of<ProjectController>(context);
    final UserController userController = Provider.of<UserController>(context);
    return Scaffold(
      appBar: mainAppBar(context, leading: true, profile: false),
      // endDrawer: mainDrawer(context)
      floatingActionButton: addEventButton(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            leadingImage(projectController),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  aboutText(projectController),
                  const SizedBox(
                    height: 10,
                  ),
                  if (userController.isSuperAdmin)
                    allEventButton(context, projectController.project!.id),
                    const SizedBox(
                    height: 10,
                  ),
                  myContributions(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget leadingImage(ProjectController projectController) {
    return Stack(
      children: [
        projectController.project!.media != null
            ? FutureBuilder(
                future: projectController.project!.mediaModel!.getUrl(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const CircularProgressIndicator();
                  }
                  return Hero(
                    tag: "${projectController.project!.name}_image",
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(snapshot.data.toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              )
            : Container(
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'lib/resources/assets/images/stock-image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height / 50,
                left: MediaQuery.of(context).size.width / 20),
            child: Text(projectController.project!.name ?? "Nome do projeto",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height / 25,
                    fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }

  Widget aboutText(ProjectController projectController) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Sobre',
          style: TextStyle(
              color: AppColors.darkGreen,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5)),
      Row(
        children: [
          Flexible(
            child: Text(
                (projectController.project!.description != null &&
                        projectController.project!.description!.isNotEmpty)
                    ? projectController.project!.description!
                    : "Não há descrição para o projeto ${projectController.project!.name}",
                style: const TextStyle(
                    color: AppColors.darkGreen,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.5)),
          ),
        ],
      ),
    ]);
  }

  Widget myContributions() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        side: const BorderSide(
          color: AppColors.darkGreen,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/my_contributions');
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Minhas Contribuições',
                style: TextStyle(
                  color: AppColors.darkGreen,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.darkGreen,
              size: 32,
            )
          ],
        ),
      ),
    );
  }

  Widget allEventButton(BuildContext context, String? projectId) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        side: const BorderSide(
          color: AppColors.darkGreen,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        Provider.of<EventController>(context, listen: false)
            .listEventsOnProject(projectId ?? "");
        Navigator.pushNamed(context, '/all_events');
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Todos Relatos',
                style: TextStyle(
                  color: AppColors.darkGreen,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.darkGreen,
              size: 32,
            )
          ],
        ),
      ),
    );
  }

  Widget addEventButton() {
    return FloatingActionButton(
      backgroundColor: AppColors.primaryGreen,
      onPressed: () {
        Navigator.pushNamed(context, '/add_event');
      },
      child: const Icon(Icons.add, color: AppColors.white),
    );
  }
}
