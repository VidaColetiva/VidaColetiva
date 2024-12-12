import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vidacoletiva/resources/widgets/main_app_bar.dart';

import '../resources/assets/colour_pallete.dart';
import '../resources/widgets/main_bottom_bar.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  void bottomBarNav(int where){
    switch(where){
      case 0:
        break;
      case 1:
        Navigator.popAndPushNamed(context, '/home');
        break;
      case 2:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context),
      bottomNavigationBar: mainBottomBar(context, 0, bottomBarNav),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/30),
                child: eventCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget eventCard(){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        fixedSize: Size(MediaQuery.of(context).size.width * 0.8, MediaQuery.of(context).size.height/10),
        backgroundColor: AppColors.white,
        side: BorderSide(
          color: AppColors.darkGreen,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: (){
        Navigator.pushNamed(context, '/event');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  '1. 29 de fevereiro, 24',
                  style: TextStyle(
                    color: AppColors.darkGreen,
                    fontSize: MediaQuery.of(context).size.height/35,
                    fontWeight: FontWeight.bold,
                  )
              ),
              Text(
                  '2 mídias, 1 áudio e 1 relato',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: MediaQuery.of(context).size.height/60,

                  )
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios_rounded, color: AppColors.darkGreen, size: MediaQuery.of(context).size.height/30,)
        ],
      ),
    );
  }
}
