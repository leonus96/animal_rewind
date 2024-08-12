import 'package:animate_do/animate_do.dart';
import 'package:extinct/presentation/home/home_page.dart';
import 'package:flutter/material.dart';

class QuaggaBg extends StatelessWidget {
  const QuaggaBg({super.key});

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
                child: Image.asset('assets/slider/quagga/quagga_bg.png')),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          top: 0,
          child: FadeInLeft(
            duration: kBackgroundLargeAnimation,
            child: Container(
                width: 400,
                padding: const EdgeInsets.only(bottom: 200),
                child:
                Image.asset('assets/slider/quagga/quagga_left.png')),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          top: 0,
          child: FadeInRight(
            duration: kBackgroundLargeAnimation,
            child: Container(
                width: 400,
                padding: const EdgeInsets.only(bottom: 200),
                child:
                Image.asset('assets/slider/quagga/quagga_rigth.png')),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: FadeInUp(
            duration: kBackgroundAnimation,
            child: Image.asset('assets/slider/quagga/quagga_bottom.png'),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: FadeInUp(
            duration: kBackgroundLargeAnimation,
            child: Image.asset('assets/slider/quagga/quagga_bottom_2.png'),
          ),
        ),
      ],
    );
  }
}
