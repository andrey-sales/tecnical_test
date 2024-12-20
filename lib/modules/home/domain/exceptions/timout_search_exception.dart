

class TimeOutSearchException implements Exception {

  final String message;

  TimeOutSearchException(this.message);

  @override
  String toString() => message;

}