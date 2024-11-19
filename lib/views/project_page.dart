import 'package:flutter/material.dart';
import 'package:vidacoletiva/resources/widgets/main_app_bar.dart';

import '../resources/assets/colour_pallete.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context, leading: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            leadingImage(),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height/30),
              child: aboutText(),
            ),
            myContributions(),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height/30),
              child: addEventButton(),
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

  Widget aboutText(){
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height/50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sobre',
            style: TextStyle(
              color: AppColors.darkGreen,
              fontSize: MediaQuery.of(context).size.height/35,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5
            )
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            style: TextStyle(
              color: AppColors.darkGreen,
              fontSize: MediaQuery.of(context).size.height/45,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.5
            )
          ),
        ]
      )
    );
  }

  Widget myContributions(){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        fixedSize: Size(MediaQuery.of(context).size.width * 0.8, MediaQuery.of(context).size.height/13),
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
        Navigator.pushNamed(context, '/events_v2');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
              'Minhas contribuições',
              style: TextStyle(
                color: AppColors.darkGreen,
                fontSize: MediaQuery.of(context).size.height/40,
                fontWeight: FontWeight.bold,
              )
          ),
          Icon(Icons.arrow_forward_ios_rounded, color: AppColors.darkGreen, size: MediaQuery.of(context).size.height/30,)
        ],
      ),
    );
  }

  Widget addEventButton(){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        fixedSize: Size(MediaQuery.of(context).size.width * 0.8, MediaQuery.of(context).size.height/13),
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
        Navigator.pushNamed(context, '/add_event');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width/12,
            height: MediaQuery.of(context).size.width/12,
            decoration: BoxDecoration(
              color: AppColors.primaryGreen,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.add, color: AppColors.white, size: MediaQuery.of(context).size.width/12),
          ),
          Text(
              'Contribuir',
              style: TextStyle(
                color: AppColors.darkGreen,
                fontSize: MediaQuery.of(context).size.height/40,
                fontWeight: FontWeight.bold,
              )
          ),
          Icon(Icons.arrow_forward_ios_rounded, color: AppColors.darkGreen,)
        ],
      ),
    );
  }
}
