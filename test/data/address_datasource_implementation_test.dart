import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:seach_cep_ddd_flutter/core/errors/server_error.dart';
import 'package:seach_cep_ddd_flutter/core/http/http_client.dart';
import 'package:seach_cep_ddd_flutter/data/datasource/address_datasource.dart';
import 'package:seach_cep_ddd_flutter/data/datasource/adress_datasource_implementation.dart';
import 'package:seach_cep_ddd_flutter/data/datasource/end_points/end_point_brasil_api.dart';
import 'package:seach_cep_ddd_flutter/domain/entities/address_entity.dart';

import '../mock/mock_adress_map.dart';


class MockHttpClient extends Mock implements HttpClient{}
main(){
late HttpClient client;
late AddressDatasource stu;
group('Data Source Implementation', (){


void sucessMock() {
    when(() => client.get(any())).thenAnswer(
        (_) async => HttpResponse(data: json.decode(adressMapMocked), statusCode: 200));
  }

  void errorMock() {
    when(() => client.get(any())).thenAnswer((_) async =>
        HttpResponse(data: 'something went error', statusCode: 400));
  }

  setUp((){
    client = MockHttpClient();
    stu = AdressDatasourceImplementation(client);
    sucessMock();
  });

  test('should return a entity address when is successfull', () async {
    final result =  await stu.getAddressFromCEP('01001000');
    expect(result.right, isA<AddressEntity>());
  });

   test('should call the get method with correct url', () async {
     const mockcep = '01001000';

     await stu.getAddressFromCEP(mockcep);
    verify(()=> client.get(EndPointBrasilApi.apod(mockcep))).called(1);
  });

     test('should thrown a ServerExecption When the call is unccessfull', () async {
    errorMock();

    final result = await stu.getAddressFromCEP('01001000');
    expect(result.left, isA<ServerFailure>());
  });
});



}