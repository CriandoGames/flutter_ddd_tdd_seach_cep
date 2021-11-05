import 'package:either_dart/either.dart';
import 'package:seach_cep_ddd_flutter/core/errors/server_error.dart';
import 'package:seach_cep_ddd_flutter/data/datasource/address_datasource.dart';
import 'package:seach_cep_ddd_flutter/domain/entities/address_entity.dart';
import 'package:seach_cep_ddd_flutter/domain/repositories/address_repository.dart';
import 'package:seach_cep_ddd_flutter/domain/value_objects/errors/failure.dart';
import 'package:seach_cep_ddd_flutter/domain/value_objects/cep.dart';

class AdressRepositoryImplementation implements AddressRepository {
  final AddressDatasource dataSource;

  AdressRepositoryImplementation(this.dataSource);

  @override
  Future<Either<Failure, AddressEntity>> getAdressByCep(Cep cep) async {
    try {
      final address = await dataSource.getAddressFromCEP(cep.value);
      return Right(address.right);
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
