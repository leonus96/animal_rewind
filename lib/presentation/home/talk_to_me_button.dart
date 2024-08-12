import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TalkToMeButton extends StatefulWidget {
  const TalkToMeButton({super.key});

  @override
  State<TalkToMeButton> createState() => _TalkToMeButtonState();
}

class _TalkToMeButtonState extends State<TalkToMeButton>
    with TickerProviderStateMixin {
  late final AnimationController _iconAnimationController;
  late final Animation<Offset> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _iconAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0, 8)).animate(
      CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.easeInOut,
      ),
    );
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AnimatedBuilder(
          animation: _iconAnimation,
          builder: (context, _) {
            if (_iconAnimationController.isCompleted) {
              _iconAnimationController.reverse();
            }

            if (_iconAnimationController.isDismissed) {
              _iconAnimationController.forward();
            }

            return Transform.translate(
              offset: _iconAnimation.value,
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 48,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            );
          }),
      Text(
        'Talk to Me',
        style: GoogleFonts.montserrat(
          textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w700
              ),
        ),
      ),
      const SizedBox(height: 8.0),
    ]);
  }
}
