import 'package:flutter/material.dart';

import '../resources/widgets/add_app_bar.dart';

class ProfileData extends StatefulWidget {
  const ProfileData({super.key});

  @override
  State<ProfileData> createState() => _ProfileDataState();
}

class _ProfileDataState extends State<ProfileData> {

  Widget displayInfo(String campo, String info, BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 15,top: 5,bottom: 5),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color(0xFF1A237E),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${campo[0].toUpperCase()}${campo.substring(1)}:',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                info,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
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
      appBar: addAppBar(context, 'Meus dados'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            displayInfo('Nome completo', 'Fulano da Silva', context),

          ],
        ),
      ),
    );
  }
}
