import 'package:flutter/material.dart';
import 'package:vidacoletiva/resources/assets/colour_pallete.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryOrange,
      child: Center(
        child: AnimatedBuilder(
          animation: _animation,
          child: Image.asset(
            "lib/resources/assets/images/logo.png",
            width: 150,
          ),
          builder: (context, child) {
            return Transform.rotate(
              angle: -_animation.value * 2.0 * 3.14159, // Full rotation in radians
              child: child,
            );
          },
        ),
      ),
    );
  }
}
