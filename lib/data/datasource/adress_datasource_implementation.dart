import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:seach_cep_ddd_flutter/core/errors/server_error.dart';
import 'package:seach_cep_ddd_flutter/core/http/http_client.dart';
import 'package:seach_cep_ddd_flutter/data/datasource/address_datasource.dart';
import 'package:seach_cep_ddd_flutter/domain/entities/address_entity.dart';

import 'end_points/end_point_brasil_api.dart';

class AdressDatasourceImplementation extends AddressDatasource {
  final HttpClient client;

  AdressDatasourceImplementation(this.client);
  @override
  Future<Either<ServerFailure,AddressEntity>> getAddressFromCEP(String cep) async {
    final response = await client.get(EndPointBrasilApi.apod(cep));

    if (response.statusCode == 200) {
      return Right(AddressEntity.fromJson(response.data));
    } else {
      return  Left(ServerFailure());
    }
  }
}
