// ignore_for_file: prefer_typing_uninitialized_variables

import 'failure.dart';

class InvalidCepFailure implements Failure {
  final message;

  InvalidCepFailure._(this.message);

  factory InvalidCepFailure() {
    return InvalidCepFailure._('InvalidCepFailure');
  }

  @override
  String toString() => 'InvalidCepFailure';
}