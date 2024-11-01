import 'failure.dart';

class CancelTokenFailure extends Failure {
  final int? statusCode;

  const CancelTokenFailure(super.errorMessage, this.statusCode);
}