class NetworkException implements Exception {
  final String message;

  NetworkException({this.message = 'No internet connection available'});

  @override
  String toString() => message;
} 