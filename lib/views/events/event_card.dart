import 'package:flutter/material.dart';
import 'package:vidacoletiva/data/models/event_model.dart';
import 'package:vidacoletiva/resources/assets/colour_pallete.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.event,
  });

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          fixedSize: Size(MediaQuery.of(context).size.width * 0.8,
              MediaQuery.of(context).size.height / 10),
          backgroundColor: AppColors.white,
          side: const BorderSide(
            color: AppColors.darkGreen,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(event.title ?? 'Título do evento',
                    style: TextStyle(
                      color: AppColors.darkGreen,
                      fontSize: MediaQuery.of(context).size.height / 35,
                      fontWeight: FontWeight.bold,
                    )),
                Text('${event.mediaModelList?.length ?? 0} mídias',
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: MediaQuery.of(context).size.height / 60,
                    )),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.darkGreen,
              size: MediaQuery.of(context).size.height / 30,
            )
          ],
        ),
      ),
    );
  }
}
