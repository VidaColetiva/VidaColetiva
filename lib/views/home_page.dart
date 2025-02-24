import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidacoletiva/controllers/project_controller.dart';
import 'package:vidacoletiva/resources/widgets/custom_buttons.dart';
import 'package:vidacoletiva/views/home/projects_carousel.dart';
import '../data/models/project_model.dart';
import '../resources/assets/colour_pallete.dart';
import '../resources/widgets/main_app_bar.dart';
import '../resources/widgets/main_bottom_bar.dart';
import '../resources/widgets/main_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void bottomBarNav(int where) {
    switch (where) {
      case 0:
        Navigator.popAndPushNamed(context, '/events');
        break;
      case 1:
        break;
      case 2:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      appBar: mainAppBar(context, scaffoldKey: scaffoldKey),
      bottomNavigationBar: mainBottomBar(context, 1, bottomBarNav),
      endDrawer: mainDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            imageCarousel(),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / 50),
              child: addButton(context, () {
                Navigator.pushNamed(context, '/add_project');
              }, 'Adicionar Projeto', AppColors.primaryOrange),
            ),
            recentProjects(),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / 50),
              child: myProjectContributions(),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageCarousel() {
    final ProjectController projectsController =
    Provider.of<ProjectController>(context);
    List<Widget> carouselImages = [];

    for (int i = 0; i < projectsController.projects.length; i++) {
      carouselImages.add(
        carouselImage(projectsController.projects[i]),
      );
    }

    return CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height / 3,
          viewportFraction: 1,
          clipBehavior: Clip.hardEdge,
        ),
        items: carouselImages);
  }

  Widget carouselImage(ProjectModel project) {
    return GestureDetector(
      onTap: () {
        final ProjectController projectController =
            Provider.of<ProjectController>(context, listen: false);
        projectController.selectedProject(project);
        Navigator.pushNamed(context, '/project');
      },
      child: Stack(
        children: [
          project.media != null ? FutureBuilder(
            future: project.mediaModel!.getUrl(),
            builder: (context, snapshot){
              if (snapshot.data == null) {
                return const CircularProgressIndicator();
              }
              return Container(
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
              child: Text(project.name!,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height / 25,
                      fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }

  Widget recentProjects() {
    final ProjectController projectsController =
        Provider.of<ProjectController>(context);
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 10,
                  vertical: MediaQuery.of(context).size.height / 50),
              child: Text('Projetos Recentes',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 30,
                      fontWeight: FontWeight.bold)),
            )),
        ProjectsCarousel(
          cardColor: AppColors.secondaryOrange,
          projectModel: projectsController.projects,
        ),
      ],
    );
  }

  Widget myProjectContributions() {
    return const SizedBox();
    // return Column(
    //   children: [
    //     Align(
    //         alignment: Alignment.centerLeft,
    //         child: Padding(
    //           padding: EdgeInsets.only(
    //             bottom: MediaQuery.of(context).size.height / 50,
    //             left: MediaQuery.of(context).size.width / 10,
    //           ),
    //           child: Text('Meus projetos',
    //               style: TextStyle(
    //                   fontSize: MediaQuery.of(context).size.height / 30,
    //                   fontWeight: FontWeight.bold)),
    //         )),
    //     Padding(
    //       padding:
    //           EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 15),
    //       child: const ProjectsCarousel(
    //         cardColor: AppColors.secondaryYellow,
    //         projectModel: [],
    //       ),
    //     ),
    //   ],
    // );
  }
}
