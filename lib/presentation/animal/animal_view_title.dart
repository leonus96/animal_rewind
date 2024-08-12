import 'package:extinct/domain/animal/animal.dart';
import 'package:flutter/material.dart';

class AnimalViewTitle extends StatelessWidget {
  final ValueNotifier<int> currentPageIndexNotifier;
  final List<Animal> animals;

  const AnimalViewTitle({
    super.key,
    required this.animals,
    required this.currentPageIndexNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ValueListenableBuilder(
        valueListenable: currentPageIndexNotifier,
        builder: (context, currentPage, _) {
          final animal = animals[currentPage];
          return Column(
            children: [
              Text(
                animal.name.toUpperCase(),
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                  shadows: <Shadow>[
                    Shadow(
                      offset: const Offset(0, 3),
                      blurRadius: 16.0,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'EXTINCT AT ${animal.extinctYear}',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onSurface,
                  shadows: <Shadow>[
                    Shadow(
                      offset: const Offset(0, 3),
                      blurRadius: 16.0,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}
