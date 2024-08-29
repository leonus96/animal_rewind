import 'package:extinct/domain/animal/animal.dart';
import 'package:extinct/presentation/chat/chat_message.dart';
import 'package:extinct/presentation/chat/model_is_typing_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatView extends StatelessWidget {
  final List<Content> chatHistory;
  final ScrollController scrollController;
  final Animal animal;
  final bool isTyping;

  const ChatView({
    super.key,
    required this.chatHistory,
    required this.scrollController,
    required this.animal,
    required this.isTyping,
  });

  @override
  Widget build(BuildContext context) {
    if (chatHistory.isEmpty) {
      return const SizedBox();
    }

    final contentList = chatHistory.toList();
    return Padding(
      padding: const EdgeInsets.only(bottom: 72),
      child: ListView.builder(
        controller: scrollController,
        itemCount: chatHistory.length + 2,
        itemBuilder: (context, i) {
          if (i == chatHistory.length) {
            return !isTyping
                ? const SizedBox()
                : ModelIsTypingWidget(animal: animal);
          }

          if (i == chatHistory.length + 1) {
            return const SizedBox(height: 64);
          }

          final content = contentList[i];

          if (content.parts.isEmpty) {
            return const SizedBox();
          }

          return Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ChatMessage(
              content: content,
              animal: animal,
            ),
          );
        },
      ),
    );
  }
}
