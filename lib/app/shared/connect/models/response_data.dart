import 'dart:convert';

class ResponseDataModel {
  final String response;
  final String? error;
  final dynamic results;

  bool get hasError => error != null;

  ResponseDataModel({
    required this.response,
    this.error,
    required this.results,
  });

  Map<String, dynamic> toMap() {
    return {
      'response': response,
      'error': error,
      'results': results,
    };
  }

  factory ResponseDataModel.fromMap(Map<String, dynamic> map) {
    return ResponseDataModel(
      response: map['response'],
      error: map['error'],
      results: map['results'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseDataModel.fromJson(String source) => ResponseDataModel.fromMap(json.decode(source));
}
