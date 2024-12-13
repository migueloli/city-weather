class NetworkException implements Exception {
  const NetworkException({this.message = 'No internet connection available'});

  final String message;

  @override
  String toString() => message;
}
