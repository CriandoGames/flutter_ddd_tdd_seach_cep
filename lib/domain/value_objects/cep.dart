import 'package:either_dart/either.dart';

import 'errors/failure.dart';
import 'errors/invalid_cep.failure.dart';
import 'errors/invalid_cep_length_failure.dart';

class Cep {
  String value;

  Cep._(this.value);

  static Either<Failure, Cep> create(String value) {
    if (value.isEmpty || value == '') {
      return Left(InvalidCepFailure());
    } else if (value.length <8 || value.length >8){
        return Left(InvalidCepLengthFailure());
    }else {
      return Right(Cep._(value));
    }
  }
}