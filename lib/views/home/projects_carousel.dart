import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidacoletiva/controllers/project_controller.dart';
import 'package:vidacoletiva/data/models/project_model.dart';
import 'package:vidacoletiva/resources/assets/colour_pallete.dart';

class ProjectsCarousel extends StatelessWidget {
  final Color cardColor;
  final List<ProjectModel> projectModel;

  const ProjectsCarousel(
      {super.key, required this.cardColor, required this.projectModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: projectModel.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? MediaQuery.of(context).size.width / 10 : 0,
              right: MediaQuery.of(context).size.width / 50,
            ),
            child: projectCard(projectModel[index], cardColor, context),
          );
        },
      ),
    );
  }

  Widget projectText(String cardText, BuildContext context,
      {required double fontSize, double? letterSpacing, int? maxLines}) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Text(
        cardText,
        softWrap: true,
        textAlign: TextAlign.left,
        maxLines: maxLines ?? 1,
        style: TextStyle(
            color: AppColors.black,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            letterSpacing: letterSpacing ?? 0,
            height: 1),
      ),
    );
  }

  Widget projectCard(
      ProjectModel projectModel, Color containerColor, BuildContext context) {
    ProjectController projectController =
        Provider.of<ProjectController>(context, listen: false);
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          projectController.selectedProject(projectModel);
          Navigator.pushNamed(context, '/project');
        },
        child: Container(
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            color: containerColor, // Cor de fundo do container
            borderRadius: BorderRadius.circular(11),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 30,
                  vertical: MediaQuery.of(context).size.height / 50,
                ),
                child: Container(
                  width: 10,
                  decoration: BoxDecoration(
                    color: AppColors.white, // Cor de fundo do container
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 50),
                      child: projectText(
                          projectModel.name ?? "Projeto", context,
                          fontSize: 20, letterSpacing: -1, maxLines: 2),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        projectText(projectModel.institution ?? "", context,
                            fontSize: 14),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height / 50),
                          child: projectText(projectModel.target ?? "", context,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
