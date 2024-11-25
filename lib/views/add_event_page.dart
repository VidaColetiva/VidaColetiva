import 'package:flutter/material.dart';
import 'package:vidacoletiva/resources/widgets/add_app_bar.dart';

import '../resources/assets/colour_pallete.dart';
import '../resources/widgets/main_app_bar.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: addAppBar(context, 'Criar um relato'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            leadingImage(),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height/30),
              child: addEventForm(),
            ),
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

  Widget addEventForm(){
    return Column(
      children: [
        TextFormField(
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
          child: buttonText(Icons.mic, 'Adicionar áudio'),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/50),
          child: buttonText(Icons.attach_file, 'Adicionar imagem'),
        ),
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

  Widget buttonText(IconData icon, String text){
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
      icon: Icon(icon, color: AppColors.darkGreen,),
      onPressed: (){},
      label: actionsText(text),
    );
  }
}
