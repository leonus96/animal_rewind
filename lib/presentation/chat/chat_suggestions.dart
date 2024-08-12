import 'package:extinct/domain/model_message/model_message.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatSuggestions extends StatelessWidget {
  final Content lastResponse;
  final Function(String) onTap;

  const ChatSuggestions(
      {super.key, required this.lastResponse, required this.onTap});

  @override
  Widget build(BuildContext context) {
    if (lastResponse.role != 'model') {
      return const SizedBox();
    }

    final message = (lastResponse.parts.first as TextPart).text;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 16.0),
          ...ModelMessage.fromGemini(message).suggestions.map((e) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ActionChip(
                label: Text(e),
                onPressed: () => onTap(e),
              ),
            );
          })
        ],
      ),
    );
  }
}
