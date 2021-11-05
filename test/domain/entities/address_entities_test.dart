import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:seach_cep_ddd_flutter/domain/entities/address_entity.dart';

import '../../mock/mock_adress_map.dart';

main() {
  group('Entity address', () {
    test('should be create a object of entities', () {
      const address =  AddressEntity(
          street: 'Rua Doutor Luiz de Freitas Melro', cep: '89010025', city: 'Blumenau', neighborhood: 'Centro');

      expect(address, isA<AddressEntity>());
    });

     test('should return a valid model', () {
       Map<String, dynamic> addressMap = json.decode(adressMapMocked);
        final result = AddressEntity.fromJson(addressMap);

        expect(result, isA<AddressEntity>());
      
    });

    test('hould return a json map containing the proper data', (){
       const address =  AddressEntity(
          street: 'Rua Doutor Luiz de Freitas Melro', cep: '89010025', city: 'Blumenau', neighborhood: 'Centro');

      final result = address.toJson();

      expect(result, {
        'street': 'Rua Doutor Luiz de Freitas Melro',
        'cep': '89010025',
        'city': 'Blumenau',
        'neighborhood': 'Centro'
      });
    });
  });
}


