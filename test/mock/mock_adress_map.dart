import 'package:seach_cep_ddd_flutter/domain/entities/address_entity.dart';

const adressMapMocked = """
{
  "cep": "89010025",
  "state": "SC",
  "city": "Blumenau",
  "neighborhood": "Centro",
  "street": "Rua Doutor Luiz de Freitas Melro",
  "service": "viacep"
}
""";
  const addressObjectMock =  AddressEntity(
          street: 'Rua Doutor Luiz de Freitas Melro', cep: '89010025', city: 'Blumenau', neighborhood: 'Centro');