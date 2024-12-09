import 'package:flutter/material.dart';
import '../resources/assets/colour_pallete.dart';
import '../resources/widgets/add_app_bar.dart';

class ProfileData extends StatefulWidget {
  const ProfileData({super.key});

  @override
  State<ProfileData> createState() => _ProfileDataState();
}

class _ProfileDataState extends State<ProfileData> {

  Widget displayInfo(String campo, String info, BuildContext context){
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height/30,
        left: MediaQuery.of(context).size.width/10,
        right: MediaQuery.of(context).size.width/10,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20, vertical: MediaQuery.of(context).size.height/200),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/13,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          border: Border.fromBorderSide(BorderSide(color: AppColors.primaryGreen, width: 2)),
          color: AppColors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${campo[0].toUpperCase()}${campo.substring(1)}:',
                style: TextStyle(
                    color: AppColors.primaryGreen,
                    fontSize: MediaQuery.of(context).size.height/50,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                info,
                style: TextStyle(
                  color: AppColors.primaryOrange,
                  fontSize: MediaQuery.of(context).size.height/45,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: addAppBar(context, 'Perfil', isEdit: true, editFunction: (){Navigator.pushNamed(context, '/edit_profile');}),
      body: SingleChildScrollView(
        child: Column(
          children: [
            displayInfo('Nome completo', 'Fulano da Silva Santos', context),
            displayInfo('Profissão', 'Pescador', context),
            displayInfo('Nascimento', '00/00/0000', context),
            displayInfo('Estado', 'Rio de Janeiro', context),
            displayInfo('Cidade', 'Niterói', context),
            displayInfo('Identidade étnico-racial', 'Branco', context),
            displayInfo('Gênero', 'Homem cis', context),
          ],
        ),
      ),
    );
  }
}
