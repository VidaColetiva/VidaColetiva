import 'package:flutter/material.dart';
import 'package:vidacoletiva/resources/assets/colour_pallete.dart';

class CustomFloatingActionButton extends StatefulWidget {
  const CustomFloatingActionButton(
      {super.key,
      required this.onClickCamera,
      required this.onClickGallery});

  final VoidCallback onClickCamera;
  final VoidCallback onClickGallery;

  @override
  _CustomFloatingActionButtonState createState() =>
      _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState extends State<CustomFloatingActionButton>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  void toggleFab() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  Widget buildAttachButton(
      IconData icon, VoidCallback onPressed, double offset) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 250),
      right: 0,
      bottom: isExpanded ? 40.0 + offset : 0,
      child: AnimatedOpacity(
        opacity: isExpanded ? 1 : 0,
        duration: const Duration(milliseconds: 200),
        child: FloatingActionButton(
          backgroundColor: AppColors.primaryGreen,
          heroTag: null,
          mini: true,
          onPressed: onPressed,
          child: Icon(icon, color: AppColors.white,),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        // Attach options
        buildAttachButton(Icons.camera_alt, widget.onClickCamera, 40),
        buildAttachButton(Icons.image, widget.onClickGallery, 90),
        // buildAttachButton(Icons.mic, widget.onClickRecord, 180),

        // Main FAB
        Positioned(
          right: 0,
          bottom: 0,
          child: FloatingActionButton(
            backgroundColor: AppColors.primaryGreen,
            onPressed: toggleFab,
            child: Icon(isExpanded ? Icons.close : Icons.attach_file, color: AppColors.white,),
          ),
        ),
      ],
    );
  }
}
