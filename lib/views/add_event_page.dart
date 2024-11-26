import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidacoletiva/controllers/project_controller.dart';
import 'package:vidacoletiva/resources/widgets/add_app_bar.dart';

import '../resources/assets/colour_pallete.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  String? _title;
  String? description;

  @override
  Widget build(BuildContext context) {
    final ProjectController projectController =
        Provider.of<ProjectController>(context);

    return Scaffold(
      appBar: addAppBar(context, 'Criar um relato'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            leadingImage(projectController),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height / 30),
              child: addEventForm(projectController),
            ),
          ],
        ),
      ),
    );
  }

  Widget leadingImage(ProjectController projectController) {
    return Stack(
      children: [
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
            child: Text(projectController.project!.name ?? "Projeto sem nome",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height / 25,
                    fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }

  Widget addEventForm(ProjectController projectController) {
    return Column(
      children: [
        TextFormField(
          onChanged: (value) {
            // projectController.project!.name = value;
          },
          cursorColor: AppColors.darkGreen,
          style: TextStyle(
            color: AppColors.darkGreen,
            fontSize: MediaQuery.of(context).size.height / 30,
          ),
          decoration: InputDecoration(
            labelText: 'Título',
            labelStyle: TextStyle(
              color: AppColors.darkGreen,
              fontSize: MediaQuery.of(context).size.height / 40,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.darkGreen,
                width: 1.5,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.darkGreen,
                width: 1,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 50),
          child: TextFormField(
            cursorColor: AppColors.darkGreen,
            maxLines: 5,
            style: TextStyle(
              color: AppColors.darkGreen,
              fontSize: MediaQuery.of(context).size.height / 40,
            ),
            decoration: InputDecoration(
              labelText: 'Descrição',
              labelStyle: TextStyle(
                color: AppColors.darkGreen,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.darkGreen,
                  width: 1.5,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.darkGreen,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 50),
          child: buttonText(Icons.mic, 'Adicionar áudio'),
        ),
        Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 50),
          child: buttonText(Icons.attach_file, 'Adicionar imagem'),
        ),
      ],
    );
  }

  Text actionsText(String text) {
    return Text(text,
        style: TextStyle(
          color: AppColors.darkGreen,
          fontSize: MediaQuery.of(context).size.height / 60,
          fontWeight: FontWeight.bold,
        ));
  }

  Widget buttonText(IconData icon, String text) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        fixedSize: Size(MediaQuery.of(context).size.width / 2,
            MediaQuery.of(context).size.height / 15),
        backgroundColor: AppColors.white,
        side: const BorderSide(
          color: AppColors.darkGreen,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      icon: Icon(
        icon,
        color: AppColors.darkGreen,
      ),
      onPressed: () {},
      label: actionsText(text),
    );
  }
}
