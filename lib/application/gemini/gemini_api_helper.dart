import 'package:extinct/application/gemini/animals_system_instructions.dart';
import 'package:extinct/application/gemini/api_key.dart';
import 'package:extinct/domain/animal/animal.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiApiHelper {
  GenerativeModel? model;
  ChatSession? chatSession;

  Iterable<Content>? get chatHistory => chatSession?.history;

  void init(Animal animal) {
    model = GenerativeModel(
      model: 'gemini-1.5-pro',
      apiKey: geminiApiKey,
      systemInstruction: AnimalsSystemInstructions().build(animal),
    );
  }

  void startChat({List<Content>? history}) {
    chatSession ??= model!.startChat(history: history);
  }

  Future<GenerateContentResponse> sendMessage(Content message) async {
    return chatSession!.sendMessage(message);
  }
}
