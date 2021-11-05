import 'package:either_dart/either.dart';
import 'package:seach_cep_ddd_flutter/domain/entities/address_entity.dart';
import 'package:seach_cep_ddd_flutter/domain/value_objects/cep.dart';
import 'package:seach_cep_ddd_flutter/domain/value_objects/errors/failure.dart';

abstract class AddressRepository {
  Future<Either<Failure,AddressEntity>> getAdressByCep(Cep cep);
}
