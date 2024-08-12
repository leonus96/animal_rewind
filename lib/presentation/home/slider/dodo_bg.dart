import 'package:animate_do/animate_do.dart';
import 'package:extinct/presentation/home/home_page.dart';
import 'package:flutter/material.dart';

class DodoBg extends StatelessWidget {
  const DodoBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          bottom: 0,
          left: 0,
          right: 0,
          top: 0,
          child: FadeInUp(
            duration: kBackgroundAnimation,
            child: Image.asset('assets/slider/dodo/dodo_bg.png'),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          child: FadeInDown(
            duration: kBackgroundLargeAnimation,
            child: SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 1.5,
              child: Image.asset('assets/slider/dodo/dodo_top_left.png'),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: FadeInUp(
            duration: kBackgroundLargeAnimation,
            child: Image.asset('assets/slider/dodo/dodo_bottom.png'),
          ),
        ),
      ],
    );
  }
}
