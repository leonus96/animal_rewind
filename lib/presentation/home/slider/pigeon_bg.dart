import 'package:animate_do/animate_do.dart';
import 'package:extinct/presentation/home/home_page.dart';
import 'package:flutter/material.dart';

class PigeonBg extends StatelessWidget {
  const PigeonBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          child: FadeIn(
            duration: kBackgroundAnimation,
            child: Image.asset('assets/slider/pigeon/pigeon_bg.png'),
          ),
        ),
        Positioned.fill(
          bottom: 0,
          left: 0,
          right: 0,
          top: 0,
          child: FadeInDown(
            duration: kBackgroundLargeAnimation,
            child: Image.asset('assets/slider/pigeon/pigeon_center.png'),
          ),
        ),

      ],
    );
  }
}
