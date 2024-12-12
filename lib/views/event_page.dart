import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vidacoletiva/resources/widgets/main_app_bar.dart';

import '../resources/assets/colour_pallete.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  List<File> imageList = [
    File('/home/joao/Desktop/STI/vidacoletiva/lib/resources/assets/images/stock-image.png'),
    File('lib/resources/assets/images/stock-image.png'),
    File('lib/resources/assets/images/stock-image.png'),
    File('lib/resources/assets/images/stock-image.png'),
    File('lib/resources/assets/images/stock-image.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            leadingImage(),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height/30),
              child: addEventForm(),
            ),
            imageCarousel(imageList),
          ],
        ),
      ),

    );
  }

  Widget leadingImage(){
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height/3.5,
          decoration: BoxDecoration(
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
                bottom: MediaQuery.of(context).size.height/50,
                left: MediaQuery.of(context).size.width/20
            ),
            child: Text(
                'Project Name',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height/25,
                    fontWeight: FontWeight.bold
                )
            ),
          ),
        )
      ],
    );
  }

  Text actionsText(String text){
    return Text(
        text,
        style: TextStyle(
          color: AppColors.darkGreen,
          fontSize: MediaQuery.of(context).size.height/60,
          fontWeight: FontWeight.bold,
        )
    );
  }

  Widget buttonText(IconData icon, String text, Function onPressed){
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        fixedSize: Size(MediaQuery.of(context).size.width/2, MediaQuery.of(context).size.height/15),
        backgroundColor: AppColors.white,
        side: BorderSide(
          color: AppColors.darkGreen,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      icon: Icon(icon, color: icon == Icons.stop? Colors.red : AppColors.darkGreen,),
      onPressed: () {
        onPressed();
      },
      label: actionsText(text),
    );
  }

  Widget audioPlayerWidget(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buttonText(Icons.play_arrow, 'Escutar áudio', () async {}),
      ],
    );
  }

  Widget addEventForm(){
    return Column(
      children: [
        TextFormField(
          readOnly: true,
          initialValue: 'Título do relato',
          cursorColor: AppColors.darkGreen,
          style: TextStyle(
            color: AppColors.darkGreen,
            fontSize: MediaQuery.of(context).size.height/30,
          ),
          decoration: InputDecoration(
            labelText: 'Título',
            labelStyle: TextStyle(
              color: AppColors.darkGreen,
              fontSize: MediaQuery.of(context).size.height/40,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.darkGreen,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.darkGreen,
                width: 1,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/50),
          child: TextFormField(
            initialValue: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ',
            readOnly: true,
            cursorColor: AppColors.darkGreen,
            maxLines: 5,
            style: TextStyle(
              color: AppColors.darkGreen,
              fontSize: MediaQuery.of(context).size.height/40,
            ),
            decoration: InputDecoration(
              labelText: 'Descrição',
              labelStyle: TextStyle(
                color: AppColors.darkGreen,
                fontSize: MediaQuery.of(context).size.height/40,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.darkGreen,
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.darkGreen,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/50),
          child: audioPlayerWidget(),
        ),
      ],
    );
  }

  Widget imageCarousel(List<File> imageFiles) {
    return imageFiles.isNotEmpty ?
    Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/15),
      child: SizedBox(
        height: 250, // Altura do carrossel
        child: PageView.builder(
          itemCount: imageFiles.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.file(
                  imageFiles[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    ) :
    Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/15),
      child: const Center(
        child: Text(
          "Adicione uma imagem",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ),
    );
  }
}
