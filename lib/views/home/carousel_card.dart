import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  final Future<String>? imageUrl;
  final String title;

  const CarouselCard({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20), // overall rounded corners
      child: Container(
        width: double.infinity, // you can adjust this for your carousel size
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Image

            AspectRatio(
              aspectRatio: 16 / 9,
              child: imageUrl != null
                  ? FutureBuilder<String>(
                      future: imageUrl,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container(
                            color: Colors.grey[200], // Placeholder color
                            child: const Center(),
                          );
                        }
                        return Hero(
                          tag: "${title}_image",
                          child: Image.network(
                            snapshot.data ?? '',
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                color: Colors.grey[200], // Placeholder color
                                child: const Center(),
                              );
                            },
                            fit: BoxFit.cover,
                          ),
                        );
                      })
                  : Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'lib/resources/assets/images/stock-image.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ), // Placeholder color),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
