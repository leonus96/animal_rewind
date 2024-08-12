import 'package:flutter/material.dart';

class UserMessageWidget extends StatelessWidget {
  final String message;

  const UserMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16.0),
              bottomLeft: Radius.circular(16.0),
              topLeft: Radius.circular(16.0),
              bottomRight: Radius.zero,
            ),
          ),
          child: Text(
            message,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
