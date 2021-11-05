import 'package:flutter_test/flutter_test.dart';
import 'package:seach_cep_ddd_flutter/domain/value_objects/cep.dart';
import 'package:seach_cep_ddd_flutter/domain/value_objects/errors/invalid_cep.failure.dart';
import 'package:seach_cep_ddd_flutter/domain/value_objects/errors/invalid_cep_length_failure.dart';

main() {
  group('CEP', () {
    test('should be return erro when value is empty', () {
      final cep = Cep.create('');

      expect(cep.isLeft, true);
      expect(cep.left, isA<InvalidCepFailure>());
    });

 test('should be return erro when cep is invalide length less 8', () {
    final cep = Cep.create('0000000');

    expect(cep.isLeft, true);
    expect(cep.left, isA<InvalidCepLengthFailure>());
  });

  test('should be return erro when cep is invalide length more 8', () {
    final cep = Cep.create('000000000');

    expect(cep.isLeft, true);
    expect(cep.left, isA<InvalidCepLengthFailure>());
  });

    test('should be return  cep when valide cep', () {
      final cep = Cep.create('01001000');

      expect(cep.isRight, true);
      expect(cep.right, isA<Cep>());
    });

  });
 
}








