
import 'package:equatable/equatable.dart';

class AddressEntity  extends Equatable{
  final String street;
  final String cep;
  final String city;
  final String neighborhood;
  

  const AddressEntity({required this.street,required this.cep, required this.city,required this.neighborhood,});

  factory AddressEntity.fromJson(Map<String, dynamic> json) {
    return AddressEntity(
      street: json['street'],
      cep: json['cep'],
      city: json['city'],
      neighborhood: json['neighborhood'],
      
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = street;
    data['cep'] = cep;
    data['city'] = city;
    data['neighborhood'] = neighborhood;
    
    return data;
  }

  @override
 
  List<Object?> get props => [street,cep,city,neighborhood];
}


