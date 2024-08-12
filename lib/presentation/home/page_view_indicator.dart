import 'package:flutter/material.dart';

class PageViewIndicator extends StatefulWidget {
  final PageController controller;
  final ValueNotifier<int> currentPageIndexNotifier;
  final int pageViewLength;

  const PageViewIndicator({
    super.key,
    required this.currentPageIndexNotifier,
    required this.pageViewLength,
    required this.controller,
  });

  @override
  State<PageViewIndicator> createState() => _PageViewIndicatorState();
}

class _PageViewIndicatorState extends State<PageViewIndicator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.pageViewLength,
        (i) => _PageViewIndicatorItem(
          index: i,
          currentPageIndexNotifier: widget.currentPageIndexNotifier,
          onTap: () {
            widget.controller.animateToPage(
              i,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
        ),
      ),
    );
  }
}

class _PageViewIndicatorItem extends StatelessWidget {
  final ValueNotifier<int> currentPageIndexNotifier;
  final int index;
  final VoidCallback onTap;

  const _PageViewIndicatorItem({
    required this.index,
    required this.currentPageIndexNotifier,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: ValueListenableBuilder(
        valueListenable: currentPageIndexNotifier,
        builder: (context, _, __) {
          final isActive = index == currentPageIndexNotifier.value;
          return AnimatedContainer(
            margin: const EdgeInsets.symmetric(horizontal: 2.0),
            width: isActive ? 32 : 16,
            height: 16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              // color: Theme.of(context).colorScheme.onSurface
              color: isActive
                  ? Theme.of(context).colorScheme.tertiary
                  : Theme.of(context).colorScheme.onSurface,
            ),
            duration: const Duration(milliseconds: 200),
          );
        },
      ),
    );
  }
}
