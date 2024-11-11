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
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/20),
                child: addEventButton(),
              )
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/20),
              child: eventCard(),
            ),
          ],
        ),
      ),
    );
  }

  Widget addEventButton(){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        fixedSize: Size(MediaQuery.of(context).size.width * 0.9, MediaQuery.of(context).size.height/10),
        backgroundColor: AppColors.white,
        side: BorderSide(
          color: AppColors.darkGreen,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: (){},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width/8,
            height: MediaQuery.of(context).size.width/8,
            decoration: BoxDecoration(
              color: AppColors.primaryGreen,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.add, color: AppColors.white, size: MediaQuery.of(context).size.width/10),
          ),
          Text(
            'Criar um evento',
            style: TextStyle(
              color: AppColors.darkGreen,
              fontSize: MediaQuery.of(context).size.height/35,
            )
          ),
          Icon(Icons.arrow_forward_ios_rounded, color: AppColors.darkGreen,)
        ],
      ),
    );
  }

  Widget eventCard(){
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height/4,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
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
                  'Lorem Ipsum Event',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height/25,
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}
