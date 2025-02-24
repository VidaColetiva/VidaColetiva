import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidacoletiva/controllers/event_controller.dart';
import 'package:vidacoletiva/controllers/project_controller.dart';
import 'package:vidacoletiva/controllers/user_controller.dart';
import 'package:vidacoletiva/resources/widgets/main_app_bar.dart';

import '../resources/assets/colour_pallete.dart';
import '../resources/widgets/main_drawer.dart';

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
      appBar: mainAppBar(context, leading: true),
      endDrawer: mainDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            leadingImage(projectController),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height / 30),
              child: aboutText(projectController),
            ),
            if (userController.isSuperAdmin)
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height / 30),
                child: allEventButton(context, projectController.project!.id),
              ),
            myContributions(),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height / 30),
              child: addEventButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget leadingImage(ProjectController projectController) {
    return Stack(
      children: [
        projectController.project!.media != null ?
        FutureBuilder(
          future: projectController.project!.mediaModel!.getUrl(),
          builder: (context, snapshot){
            if (snapshot.data == null) {
              return const CircularProgressIndicator();
            }

            return Container(
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(snapshot.data.toString()),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ) :
        Container(
          height: MediaQuery.of(context).size.height / 3.5,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/resources/assets/images/stock-image.png'),
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
    return Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height / 50),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Sobre',
              style: TextStyle(
                  color: AppColors.darkGreen,
                  fontSize: MediaQuery.of(context).size.height / 35,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5)),
          Text(
              (projectController.project!.description != null &&
                      projectController.project!.description!.isNotEmpty)
                  ? projectController.project!.description!
                  : "Não há descrição para o projeto ${projectController.project!.name}",
              style: TextStyle(
                  color: AppColors.darkGreen,
                  fontSize: MediaQuery.of(context).size.height / 45,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.5)),
        ]));
  }

  Widget myContributions() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        fixedSize: Size(MediaQuery.of(context).size.width * 0.8,
            MediaQuery.of(context).size.height / 13),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Minhas contribuições',
              style: TextStyle(
                color: AppColors.darkGreen,
                fontSize: MediaQuery.of(context).size.height / 40,
                fontWeight: FontWeight.bold,
              )),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.darkGreen,
            size: MediaQuery.of(context).size.height / 30,
          )
        ],
      ),
    );
  }

  Widget allEventButton(BuildContext context, String? projectId) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        fixedSize: Size(MediaQuery.of(context).size.width * 0.8,
            MediaQuery.of(context).size.height / 13),
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
        Provider.of<EventController>(context, listen:false).listEventsOnProject(projectId ?? "");
        Navigator.pushNamed(context, '/all_events');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Todos Relatos',
              style: TextStyle(
                color: AppColors.darkGreen,
                fontSize: MediaQuery.of(context).size.height / 40,
                fontWeight: FontWeight.bold,
              )),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.darkGreen,
            size: MediaQuery.of(context).size.height / 30,
          )
        ],
      ),
    );
  }

  Widget addEventButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        fixedSize: Size(MediaQuery.of(context).size.width * 0.8,
            MediaQuery.of(context).size.height / 13),
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
        Navigator.pushNamed(context, '/add_event');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primaryGreen,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.add, color: AppColors.white, size: 24),
          ),
          Text('Contribuir',
              style: TextStyle(
                color: AppColors.darkGreen,
                fontSize: MediaQuery.of(context).size.height / 40,
                fontWeight: FontWeight.bold,
              )),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.darkGreen,
          )
        ],
      ),
    );
  }
}
