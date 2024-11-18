import 'package:flutter/material.dart';
import 'package:vidacoletiva/resources/widgets/add_app_bar.dart';

class AddProjectPage extends StatefulWidget {
  const AddProjectPage({super.key});

  @override
  State<AddProjectPage> createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: addAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),

    );
  }
}
