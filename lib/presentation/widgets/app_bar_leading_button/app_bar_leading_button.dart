import 'package:flutter/material.dart';

class AppBarLeadingButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;

  const AppBarLeadingButton(
      {super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
        ),
      ),
    );
  }
}
