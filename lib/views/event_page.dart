import 'package:flutter/material.dart';
import 'package:vidacoletiva/data/models/event_model.dart';
import 'package:vidacoletiva/data/models/media_model.dart';
import 'package:vidacoletiva/resources/assets/colour_pallete.dart';

import 'package:carousel_slider/carousel_slider.dart';

class EventPage extends StatelessWidget {
  final EventModel event;

  const EventPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          event.title ?? "",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryOrange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: MediaQuery.of(context).size.height / 25,
          color: AppColors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.title ?? "",
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                event.text ?? "",
              ),
              Text(event.description ?? ""),
              imageCarousel(context),
            ],
          ),
        ),
      ),
    );
  }

  Iterable<Widget> photoList() {
    return event.mediaModelList!.map((media) {
      return FutureBuilder<String>(
        future: media.getUrl(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Image.network(
              snapshot.data.toString(),
              fit: BoxFit.fitWidth,
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      );
    });
  }

  Widget imageCarousel(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
          height: 400,
          viewportFraction: 1,
          enableInfiniteScroll: false,
          clipBehavior: Clip.hardEdge,
        ),
        items: (event.mediaModelList != null &&
                event.mediaModelList!.isNotEmpty)
            ? [...event.mediaModelList!.map((e) => carouselImage(context, e))]
            : []);
  }

  Widget carouselImage(BuildContext context, MediaModel media) {
    return FutureBuilder<String>(
        future: media.getUrl(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const CircularProgressIndicator();
            
          }
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      snapshot.data.toString(),
                    ), // AssetImage('lib/resources/assets/images/stock-image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
