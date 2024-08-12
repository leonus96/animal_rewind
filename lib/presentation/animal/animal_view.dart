import 'package:animate_do/animate_do.dart';
import 'package:extinct/domain/animal/animal.dart';
import 'package:flutter/material.dart';

class AnimalView extends StatelessWidget {
  final Animal animal;

  const AnimalView({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeIn(
            duration: const Duration(seconds: 1),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Image.asset('assets/slider/${animal.key}_img.png'),
            ),
          ),
        ],
      ),
    );
  }
}
