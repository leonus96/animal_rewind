import 'dart:convert';

class ModelMessage {
  final Map<String, dynamic> map;

  ModelMessage._({required this.map});

  factory ModelMessage.fromGemini(String message) {
    final cleanMessage =
        message.replaceFirst('```json', '').replaceAll('```', '');
    return ModelMessage._(map: jsonDecode(cleanMessage));
  }

  String get message => map['response'];

  String? get resourceKey => map['resource'];

  List<String> get suggestions =>
      map['suggestions'] == null ? [] : map['suggestions'].split(',');
}
