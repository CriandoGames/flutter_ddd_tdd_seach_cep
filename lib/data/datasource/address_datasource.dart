
import 'package:either_dart/either.dart';
import 'package:seach_cep_ddd_flutter/core/errors/server_error.dart';
import 'package:seach_cep_ddd_flutter/domain/entities/address_entity.dart';

abstract class AddressDatasource {
  Future<Either<ServerFailure,AddressEntity>> getAddressFromCEP(String cep);
}