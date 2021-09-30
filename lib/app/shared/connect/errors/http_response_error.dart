class HttpResponseError implements Exception {
  final String? statusError;
  final dynamic body;

  HttpResponseError({required this.body, required this.statusError});

  String get message {
    if (body == null) return statusError ?? '';

    return body.toString();
  }

  @override
  String toString() => 'statusError: $statusError, body: $body';
}
