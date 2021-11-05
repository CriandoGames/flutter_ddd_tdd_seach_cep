import 'failure.dart';

class InvalidCepLengthFailure implements Failure {

   // ignore: prefer_typing_uninitialized_variables
   final message;

  InvalidCepLengthFailure._(this.message);

  factory InvalidCepLengthFailure() {
    return InvalidCepLengthFailure._('InvalidCepLengthFailure');
  }
  @override
  String toString() => 'InvalidCepLengthFailure';
}