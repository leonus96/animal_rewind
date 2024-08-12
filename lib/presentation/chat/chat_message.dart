import 'package:extinct/domain/animal/animal.dart';
import 'package:extinct/presentation/chat/model_message_widget.dart';
import 'package:extinct/presentation/chat/user_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatMessage extends StatelessWidget {
  final Content content;
  final Animal animal;

  const ChatMessage({super.key, required this.content, required this.animal});

  bool _isFromModel() => content.role == 'model';

  @override
  Widget build(BuildContext context) {
    final message = (content.parts.first as TextPart).text;
    return _isFromModel()
        ? ModelMessageWidget(message: message, animal: animal,)
        : UserMessageWidget(message: message);
  }
}
