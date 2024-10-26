abstract class AppException implements Exception {
  final String message;
  final String? devDetails;
  final String? prettyDetails;

  AppException({
    required this.message,
    this.devDetails,
    this.prettyDetails,
  });

  @override
  String toString() =>
      'BackendException(message: $message, devDetails: $devDetails, prettyDetails: $prettyDetails)';
}

class BackendException extends AppException {
  BackendException(
      {required super.message, super.devDetails, super.prettyDetails});
}

class InternalExcpetion extends AppException {
  InternalExcpetion(
      {required super.message, super.devDetails, super.prettyDetails});
}
