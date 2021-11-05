
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:seach_cep_ddd_flutter/domain/repositories/address_repository.dart';
import 'package:seach_cep_ddd_flutter/domain/value_objects/cep.dart';

class HomeController extends GetxController{
  final AddressRepository respository;

  HomeController(this.respository);

  final rua = ''.obs;
  final bairro = ''.obs;
  final cidade = ''.obs;
  final cepcurrent = ''.obs;
  
  void setCep(String? value) async{

    if(value == null || value.isEmpty){
      return;
    }else {
      var cep =  Cep.create(value);
      if(cep.isRight){
        final result = await respository.getAdressByCep(cep.right);
        if(result.isRight){
          rua.value = result.right.street;
          bairro.value = result.right.neighborhood;
          cidade.value = result.right.city;
          cepcurrent.value = result.right.cep;
        }
      }
      
    }
    
    
  }

}