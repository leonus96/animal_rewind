import 'package:animate_do/animate_do.dart';
import 'package:extinct/presentation/home/home_page.dart';
import 'package:flutter/material.dart';

class BucardoBg extends StatelessWidget {
  const BucardoBg({super.key});

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
                child: Image.asset('assets/slider/bucardo/bucardo_bg.png')),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: FadeInLeft(
            duration: kBackgroundLargeAnimation,
            child: Container(
                width: 400,
                child:
                Image.asset('assets/slider/bucardo/bucardo_left.png')),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: FadeInUp(
            duration: kBackgroundAnimation,
            child: Image.asset('assets/slider/bucardo/bucardo_bottom.png'),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: FadeInRight(
            duration: kBackgroundLargeAnimation,
            child: SizedBox(
                width: 250,
                child:
                Image.asset('assets/slider/bucardo/bucardo_right.png')),
          ),
        ),
      ],
    );
  }
}
