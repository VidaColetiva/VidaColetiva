import 'package:flutter/material.dart';
import 'package:vidacoletiva/data/models/event_model.dart';
import 'package:vidacoletiva/resources/assets/colour_pallete.dart';
import 'package:vidacoletiva/views/event_page.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.event,
  });

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: AppColors.white,
          side: const BorderSide(
            color: AppColors.darkGreen,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EventPage(event: event),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(event.title ?? 'Título do evento',
                      style: const TextStyle(
                        color: AppColors.darkGreen,
                        fontSize: 12, // MediaQuery.of(context).size.height / 35,
                        fontWeight: FontWeight.bold,
                      )),
                  Text('${event.mediaList?.length ?? 0} mídias',
                      style: const TextStyle(
                        color: AppColors.grey,
                        fontSize: 12,
                      )),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.darkGreen,
                size: 24,
              )
            ],
          ),
        ),
      ),
    );
  }
}
