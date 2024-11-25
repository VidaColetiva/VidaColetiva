import 'package:flutter/material.dart';
import 'package:vidacoletiva/resources/widgets/add_app_bar.dart';

import '../resources/assets/colour_pallete.dart';

class AddProjectPage extends StatefulWidget {
  const AddProjectPage({super.key});

  @override
  State<AddProjectPage> createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: addAppBar(context, 'Criar um projeto'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height/30),
              child: formImage(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/120, horizontal: MediaQuery.of(context).size.width/20),
              child: customFormField(
                controller: TextEditingController(),
                info: 'a',
                label: 'Instituição',
                minLines: 1,
                maxLines: 1,
                tipo: TextInputType.text,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/120, horizontal: MediaQuery.of(context).size.width/20),
              child: customFormField(
                controller: TextEditingController(),
                info: 'o',
                label: 'Publico alvo',
                minLines: 1,
                maxLines: 1,
                tipo: TextInputType.text,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/120, horizontal: MediaQuery.of(context).size.width/20),
              child: customFormField(
                controller: TextEditingController(),
                info: 'a',
                label: 'Descrição',
                minLines: 5,
                maxLines: 10,
                tipo: TextInputType.multiline,
              ),
            ),
          ],
        ),
      ),

    );
  }

  Widget formImage(){
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height/3.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[AppColors.grey, AppColors.primaryOrange]
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(5, 5), // changes position of shadow
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          child: IconButton(
            icon: Icon(Icons.image_outlined),
            color: AppColors.white,
            onPressed: () {  },),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height/50,),
            child: TextFormField(
              cursorColor: AppColors.white,
              style: TextStyle(
                color: AppColors.white,
                fontSize: MediaQuery.of(context).size.height/30,
              ),
              decoration: InputDecoration(
                labelText: 'Título do projeto',
                labelStyle: TextStyle(
                  color: AppColors.white,
                  fontSize: MediaQuery.of(context).size.height/30,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.white, // Cor da barra inferior quando o campo está focado
                    width: 2.0,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white, // Cor da barra inferior quando o campo não está focado
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget customFormField(
      {
        required TextEditingController controller,
        required String info,
        required String label,
        int? minLines,
        int? maxLines,
        TextInputType? tipo,
      }
      ){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        keyboardType: tipo,
        controller: controller,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.height/40,
          color: AppColors.darkGreen
        ),
        decoration: InputDecoration(
          hintText: 'Informe $info ${label.toLowerCase()}...',
          border: const OutlineInputBorder(),
          labelText: label,
          labelStyle: const TextStyle(color: AppColors.darkGreen),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryOrange, // Cor da barra inferior quando o campo está focado
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.darkGreen, // Cor da barra inferior quando o campo não está focado
              width: 1,
            ),
          ),
        ),
        validator: (value){
          if (value!.isEmpty){
            return 'Informe $info $label...';
          }
          return null;
        },
        cursorColor: AppColors.darkGreen,
        minLines: minLines,
        maxLines: maxLines,
      ),
    );
  }
}
