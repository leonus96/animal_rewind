import 'package:animate_do/animate_do.dart';
import 'package:extinct/presentation/home/home_page.dart';
import 'package:flutter/material.dart';

class TortoiseBg extends StatelessWidget {
  const TortoiseBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          child: FadeInUp(
            duration: kBackgroundAnimation,
            child: Opacity(
                opacity: 0.5,
                child: Image.asset('assets/slider/tortoise/tortoise_bg.png')),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: FadeInUp(
            duration: kBackgroundLargeAnimation,
            child: Image.asset('assets/slider/tortoise/tortoise_bottom_2.png'),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: FadeInUp(
            duration: kBackgroundAnimation,
            child: Image.asset('assets/slider/tortoise/tortoise_bottom.png'),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: FadeInDown(
            duration: kBackgroundLargeAnimation,
            child: Image.asset('assets/slider/tortoise/tortoise_top.png'),
          ),
        ),
      ],
    );
  }
}
