import 'package:extinct/domain/animal/animal.dart';
import 'package:extinct/domain/model_message/model_message.dart';
import 'package:extinct/presentation/resource/resource_widget.dart';
import 'package:flutter/material.dart';

class ModelMessageWidget extends StatelessWidget {
  final String message;
  final Animal animal;

  const ModelMessageWidget({
    super.key,
    required this.message,
    required this.animal,
  });

  @override
  Widget build(BuildContext context) {
    final modelMessage = ModelMessage.fromGemini(message);

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
          padding: const EdgeInsets.all(8.0),
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
          child: Column(
            children: [
              Text(
                modelMessage.message,
                textAlign: TextAlign.left,
              ),
              if (modelMessage.resourceKey != null) ...[
                const SizedBox(height: 16.0),
                ResourceWidget(
                  animal: animal,
                  resourceKey: modelMessage.resourceKey!,
                ),
              ]
            ],
          ),
        ),
      ],
    );
  }
}
