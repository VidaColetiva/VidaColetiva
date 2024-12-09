import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../resources/assets/colour_pallete.dart';
import '../resources/widgets/add_app_bar.dart';

class EditProfileData extends StatefulWidget {
  const EditProfileData({super.key});

  @override
  State<EditProfileData> createState() => _EditProfileDataState();
}

class _EditProfileDataState extends State<EditProfileData> {
  String? selectedState;

  Future<List<String>> getStates() async {
    List<String> tempStates = [];
    await http.get(Uri.parse('https://servicodados.ibge.gov.br/api/v1/localidades/estados'))
        .then((response) {
      var json = jsonDecode(response.body);
      for (var state in json) {
        tempStates.add(state['nome']);
      }
    });
    return tempStates;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: addAppBar(context, 'Editar Perfil'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            textForm('Nome completo', 'Fulano da Silva Santos', context),
            textForm('Profissão', 'Pescador', context),
            textForm('Nascimento', '00/00/0000', context),
            FutureBuilder<List<String>>(
              future: getStates(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return dropdownMenu('Estado', snapshot.data!, context);
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            dropdownMenu('Cidade', ['a','b','c'], context),
            dropdownMenu('Identidade étnico-racial', ['a','b','c'], context),
            dropdownMenu('Gênero', ['a','b','c'], context),
          ],
        ),
      ),
    );
  }


  Widget dropdownMenu(String label, List<String> items, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height/30,
        left: MediaQuery.of(context).size.width/10,
        right: MediaQuery.of(context).size.width/10,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: AppColors.primaryGreen,
            width: 2,
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            dropdownStyleData: DropdownStyleData(
              maxHeight: MediaQuery.of(context).size.height/3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: AppColors.primaryGreen,
              ),
              elevation: 2,
            ),
            hint: Text(
              label,
              style: TextStyle(
                color: AppColors.primaryOrange,
              ),
            ),
            items: items.map((String item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            )).toList(),
            value: selectedState,
            onChanged: (String? value) {
              setState(() {
                print(items);
                print(value);
                selectedState = value;
              });
            },
          ),
        ),
      ),
    );
  }

  textForm(String label, String initialValue, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height/30,
        left: MediaQuery.of(context).size.width/10,
        right: MediaQuery.of(context).size.width/10,
      ),
      child: TextFormField(
        cursorColor: AppColors.primaryOrange,
        initialValue: initialValue,
        style: TextStyle(
          color: AppColors.primaryOrange,
        ),
        decoration: InputDecoration(
          fillColor: AppColors.white,
          labelText: label,
          labelStyle: TextStyle(
            color: AppColors.primaryGreen,
            fontWeight: FontWeight.bold,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryGreen,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryGreen,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
