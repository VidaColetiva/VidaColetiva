import 'package:flutter/material.dart';
import '../assets/colour_pallete.dart';

class DiagonalLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white // Cor da linha
      ..strokeWidth = 2.0;   // Espessura da linha

    // Desenhar uma linha diagonal
    canvas.drawLine(
      Offset(0, 0),          // Começo da linha (canto superior esquerdo)
      Offset(size.width, size.height), // Fim da linha (canto inferior direito)
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

AppBar addAppBar(BuildContext context){
  return AppBar(
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.close),
      iconSize: MediaQuery.of(context).size.height/25,
      color: AppColors.white,
      onPressed: (){Navigator.pop(context);},
    ),
    toolbarHeight: MediaQuery.of(context).size.height/9,
    title: Text(
      'Criar um relato',
      style: TextStyle(
        color: AppColors.white,
        fontSize: MediaQuery.of(context).size.height/35,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: AppColors.primaryOrange,
    actions: [
      IconButton(
        icon: const Icon(Icons.check),
        iconSize: MediaQuery.of(context).size.height/25,
        color: AppColors.white,
        onPressed: (){},
      ),

    ],
  );
}