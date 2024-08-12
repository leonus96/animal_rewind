import 'package:animate_do/animate_do.dart';
import 'package:extinct/presentation/home/home_page.dart';
import 'package:flutter/material.dart';

class ThylacineBg extends StatelessWidget {
  const ThylacineBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          child: FadeIn(
            duration: kBackgroundAnimation,
            child: Opacity(
                opacity: 0.5,
                child: Image.asset('assets/slider/thylacine/thylacine_bg.png')),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: FadeInUp(
            duration: kBackgroundAnimation,
            child: Image.asset('assets/slider/thylacine/thylacine_bottom.png'),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: FadeInUp(
            duration: kBackgroundLargeAnimation,
            child: Image.asset('assets/slider/thylacine/thylacine_bottom_2.png'),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          top: 0,
          child: FadeInLeft(
            duration: kBackgroundLargeAnimation,
            child: Container(
                width: 150,
                padding: const EdgeInsets.only(bottom: 250),
                child:
                    Image.asset('assets/slider/thylacine/thylacine_left.png')),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          top: 0,
          child: FadeInRight(
            duration: kBackgroundLargeAnimation,
            child: Container(
                width: 150,
                padding: const EdgeInsets.only(bottom: 200),
                child:
                    Image.asset('assets/slider/thylacine/thylacine_rigth.png')),
          ),
        ),
      ],
    );
  }
}
