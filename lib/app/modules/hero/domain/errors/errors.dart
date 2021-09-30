abstract class QueryError implements Exception {
  String get message => '';
}

class ValidationError implements QueryError {
  final String _message;

  ValidationError(this._message);

  @override
  String get message => _message;

  @override
  String toString() {
    return message;
  }
}

class DatasourceError implements QueryError {
  final String _message;

  DatasourceError(this._message);

  @override
  String get message => _message;

  @override
  String toString() {
    return message;
  }
}
