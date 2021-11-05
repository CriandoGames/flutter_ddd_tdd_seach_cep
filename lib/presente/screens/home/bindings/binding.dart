import 'package:get/get.dart';
import 'package:seach_cep_ddd_flutter/core/http/http_client.dart';
import 'package:seach_cep_ddd_flutter/core/http/http_client_implementatation.dart';
import 'package:seach_cep_ddd_flutter/data/datasource/address_datasource.dart';
import 'package:seach_cep_ddd_flutter/data/datasource/adress_datasource_implementation.dart';
import 'package:seach_cep_ddd_flutter/data/repositories/adress_repository_implementation.dart';
import 'package:seach_cep_ddd_flutter/domain/repositories/address_repository.dart';
import 'package:seach_cep_ddd_flutter/presente/screens/home/controller/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HttpClient>(() => HttpClientImplementatation());
    Get.lazyPut<AddressDatasource>(() => AdressDatasourceImplementation(Get.find<HttpClient>()));
    Get.lazyPut<AddressRepository>(() => AdressRepositoryImplementation(Get.find<AddressDatasource>()));
    Get.lazyPut<HomeController>(() => HomeController(Get.find<AddressRepository>()));
  }
}