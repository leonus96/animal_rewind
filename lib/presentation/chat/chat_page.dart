import 'package:extinct/application/gemini/gemini_api_helper.dart';
import 'package:extinct/domain/animal/animal.dart';
import 'package:extinct/presentation/chat/chat_suggestions.dart';
import 'package:extinct/presentation/chat/chat_view.dart';
import 'package:extinct/presentation/widgets/app_bar_leading_button/app_bar_leading_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatPage extends StatefulWidget {
  final Animal animal;

  const ChatPage({super.key, required this.animal});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final GeminiApiHelper _geminiApiHelper = GeminiApiHelper();
  final TextEditingController _inputController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Content> _chatHistory = [];
  bool _isTyping = false;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _geminiApiHelper.init(widget.animal);
    _geminiApiHelper.startChat();
  }

  @override
  Widget build(BuildContext context) {
    final scrollPositionIsAttached = _scrollController.positions.isNotEmpty;
    if (scrollPositionIsAttached) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: AppBarLeadingButton(
          icon: Icons.arrow_upward,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.animal.name.toUpperCase(),
              style: GoogleFonts.merriweather(
                fontWeight: FontWeight.w900,
                textStyle: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Text(
              'EXTINCT AT ${widget.animal.extinctYear}',
              style: GoogleFonts.montserrat(
                textStyle: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ChatView(
                  animal: widget.animal,
                  chatHistory: _chatHistory,
                  scrollController: _scrollController,
                  isTyping: _isTyping,
                ),
              ),
            ),
            Positioned(
              bottom: 16.0,
              left: 0,
              right: 0,
              child: IgnorePointer(
                ignoring: _isError,
                child: Opacity(
                  opacity: _isError ? 0.5 : 1.0,
                  child: Column(
                    children: [
                      if (_chatHistory.isNotEmpty)
                        ChatSuggestions(
                          lastResponse: _chatHistory.last,
                          onTap: _onSuggestionTap,
                        ),
                      const SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _inputController,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  hintText: 'Type something...',
                                ),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            FloatingActionButton(
                              backgroundColor:
                                  Theme.of(context).colorScheme.tertiary,
                              onPressed: _sendMessage,
                              child: Icon(
                                Icons.send,
                                color: Theme.of(context).colorScheme.onTertiary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() async {
    final message = Content.text(_inputController.text);
    _inputController.text = '';

    setState(() {
      _chatHistory.add(message);
      _isTyping = true;
    });

    final focusScope = FocusScope.of(context);
    try {
      await _geminiApiHelper.sendMessage(message);
    } catch (e,s) {
      print(e);
      print(s);
      _chatHistory.add(Content('model', [
        TextPart(
            '{"response": "🔴 Parece que me he tomado un descanso inesperado '
            'en la era equivocada. Estoy fuera de servicio por un momento, '
            'pero no te preocupes, no me he extinguido del todo '
            '(¡todavía no!). 🔧", "resource": null,"suggestions":null}')
      ]));
      _isError = true;
      _isTyping = false;
      focusScope.requestFocus(FocusNode());
      setState(() {});
      return;
    }

    setState(() {
      _chatHistory = _geminiApiHelper.chatHistory!.toList();
      _isTyping = false;
    });
  }

  void _onSuggestionTap(String suggestion) {
    _inputController.text = suggestion;
    _sendMessage();
  }
}
