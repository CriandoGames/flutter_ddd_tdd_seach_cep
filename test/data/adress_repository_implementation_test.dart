import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:seach_cep_ddd_flutter/core/errors/server_error.dart';
import 'package:seach_cep_ddd_flutter/data/datasource/address_datasource.dart';
import 'package:seach_cep_ddd_flutter/data/repositories/adress_repository_implementation.dart';
import 'package:seach_cep_ddd_flutter/domain/value_objects/cep.dart';

import '../mock/mock_adress_map.dart';

class MockAdressDatasource extends Mock implements AddressDatasource {}

main() {
  late AdressRepositoryImplementation sut;
  late MockAdressDatasource mockDatasource;

  group('Adress Repository', () {
    setUp(() {
      mockDatasource = MockAdressDatasource();
      sut = AdressRepositoryImplementation(mockDatasource);
    });

    test('should return entity model when calls the datasource', () async {
      const cep = '01001000';

      when(() => mockDatasource.getAddressFromCEP(cep))
          .thenAnswer((_) async => const Right(addressObjectMock));

      final result = await sut.getAdressByCep(Cep.create(cep).right);
      expect(result.isRight, true);
      expect(result.right, addressObjectMock);
    });

    test('should return a servver failure when call to datasource is unsucessfull', () async {
      const cep = '01001000';

      when(() => mockDatasource.getAddressFromCEP(cep))
          .thenThrow((ServerFailure()));

      final result = await sut.getAdressByCep(Cep.create(cep).right);
      expect(result.isLeft, true);
      //expect(result.left, isA<ServerFailure>());
    });
  });
}
