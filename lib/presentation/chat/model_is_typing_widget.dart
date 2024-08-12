import 'package:extinct/domain/animal/animal.dart';
import 'package:flutter/material.dart';

class ModelIsTypingWidget extends StatelessWidget {
  final Animal animal;

  const ModelIsTypingWidget({
    super.key,
    required this.animal,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          backgroundImage:
              AssetImage('assets/avatar/${animal.key}_avatar.png'),
          radius: 24,
        ),
        const SizedBox(width: 8.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 16.0),
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16.0),
              bottomLeft: Radius.circular(16.0),
              topLeft: Radius.zero,
              bottomRight: Radius.circular(16.0),
            ),
          ),
          child: const _TypingIndicator(),
        ),
      ],
    );
  }
}

class _TypingIndicator extends StatefulWidget {
  const _TypingIndicator();

  @override
  State<_TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<_TypingIndicator>
    with TickerProviderStateMixin {
  late final List<AnimationController> controllers;
  late final List<Animation> animations;
  final List<Function(AnimationStatus)> statusListeners = [];

  @override
  void initState() {
    super.initState();

    controllers = List.generate(
      3,
      (i) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200),
      ),
    );

    animations = controllers.map((e) {
      return Tween<double>(begin: 0, end: -8)
          .animate(CurvedAnimation(parent: e, curve: Curves.easeInOut));
    }).toList();

    for (var i = 0; i < controllers.length; i++) {
      statusListeners.add((AnimationStatus status) =>
          _onAnimationStatusChanged(status, controllers[i], i));
      controllers[i].addStatusListener(statusListeners[i]);
    }

    _start();
  }

  void _start() async {
    for (final controller in controllers) {
      controller.forward();
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  void _onAnimationStatusChanged(
    AnimationStatus status,
    AnimationController controller,
    int index,
  ) async {
    switch (status) {
      case AnimationStatus.dismissed:
        await Future.delayed(const Duration(milliseconds: 400));
        if (mounted) {
          controller.forward();
        }
        break;
      case AnimationStatus.completed:
        controller.reverse();
        break;
      case AnimationStatus.forward:
      case AnimationStatus.reverse:
        break;
    }
  }

  @override
  void dispose() {
    for (var i = 0; i < controllers.length; i++) {
      controllers[i].removeStatusListener(statusListeners[i]);
      controllers[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      const SizedBox(width: 4.0),
      for (var i in List.generate(3, (i) => i)) ...[
        _TypingIndicatorItem(
          animation: animations[i],
        ),
        const SizedBox(width: 4.0),
      ]
    ]);
  }
}

class _TypingIndicatorItem extends StatelessWidget {
  final Animation animation;

  const _TypingIndicatorItem({required this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        return Transform.translate(
          offset: Offset(0, animation.value),
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        );
      },
    );
  }
}
