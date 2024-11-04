import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../resources/assets/colour_pallete.dart';
import '../resources/widgets/main_app_bar.dart';
import '../resources/widgets/main_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context),
      bottomNavigationBar: mainBottomBar(context, _selectedIndex, _onItemTapped),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            imageCarousel(),
            recentProjects(),
            myProjectContributions(),
          ],
        ),
      ),

    );
  }

  Widget imageCarousel(){
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height/3,
        viewportFraction: 1,
        clipBehavior: Clip.hardEdge,
      ),
      items: [
        carouselImage(),
        carouselImage(),
        carouselImage(),
        carouselImage(),
        carouselImage(),
      ]
    );
  }

  Widget carouselImage(){
    return Stack(
      children: [
        Container(
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
                fontSize: MediaQuery.of(context).size.height/20,
                fontWeight: FontWeight.bold
              )
            ),
          ),
        )
      ],
    );
  }

  Widget recentProjects(){
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width/10,
              vertical: MediaQuery.of(context).size.height/50
            ),
            child: Text(
              'Projetos Recentes',
              style: TextStyle(fontSize: MediaQuery.of(context).size.height/25, fontWeight: FontWeight.bold)
            ),
          )
        ),
        projectCarousel(AppColors.secondaryOrange),
      ],
    );
  }

  Widget myProjectContributions(){
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height/50,
                left: MediaQuery.of(context).size.width/10,
              ),
              child: Text(
                  'Minhas Contribuições',
                  style: TextStyle(fontSize: MediaQuery.of(context).size.height/25, fontWeight: FontWeight.bold)
              ),
            )
        ),
        projectCarousel(AppColors.secondaryYellow),
      ],
    );
  }

  Widget projectCarousel(Color cardColor){
    return SizedBox(
      height: MediaQuery.of(context).size.height/4,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index){
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? MediaQuery.of(context).size.width / 10 : 0,
              right: MediaQuery.of(context).size.width / 50,
            ),
            child: projectCard(cardColor),
          );
        },
      ),
    );
  }

  Widget projectCard(Color containerColor) {
    Widget projectText(String cardText, {required int fontSize, double? letterSpacing, int? maxLines}) {
      return Padding(
        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 30),
        child: Text(
          cardText,
          softWrap: true,
          textAlign: TextAlign.left,
          maxLines: maxLines??1,
          style: TextStyle(
            color: AppColors.darkGreen,
            fontSize: MediaQuery.of(context).size.height/fontSize,
            fontWeight: FontWeight.bold,
            letterSpacing: letterSpacing??0,
            height: 1
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 50),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2.5,
            height: MediaQuery.of(context).size.height / 6,
            decoration: BoxDecoration(
              color: containerColor, // Cor de fundo do container
              borderRadius: BorderRadius.circular(11),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 30,
                    vertical: MediaQuery.of(context).size.height / 50,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 150,
                    decoration: BoxDecoration(
                      color: AppColors.darkGreen, // Cor de fundo do container
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 50),
                        child: projectText('Nome do Projeto', fontSize: 35, letterSpacing: -1, maxLines: 2),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          projectText('Instituição', fontSize: 60),
                          Padding(
                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 50),
                            child: projectText('Publico Alvo', fontSize: 60),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
