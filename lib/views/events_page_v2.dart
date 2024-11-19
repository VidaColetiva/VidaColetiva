import 'package:flutter/material.dart';
import '../resources/assets/colour_pallete.dart';
import '../resources/widgets/main_app_bar.dart';

class EventsPageV2 extends StatefulWidget {
  const EventsPageV2({super.key});

  @override
  State<EventsPageV2> createState() => _EventsPageV2State();
}

class _EventsPageV2State extends State<EventsPageV2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context, leading: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/30),
              child: Text(
                  'Minhas contribuições',
                  style: TextStyle(
                    color: AppColors.darkGreen,
                    fontSize: MediaQuery.of(context).size.height/30,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),

            ElevatedButton(
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
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.7, MediaQuery.of(context).size.height/15),
                  backgroundColor: AppColors.darkGreen,
                  side: BorderSide(
                    color: AppColors.darkGreen,
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: (){
                  Navigator.pushNamed(context, '/add_event');
                },
                child: Text(
                    'Contribuir',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: MediaQuery.of(context).size.height/35,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }


}
