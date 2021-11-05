import 'package:get/get.dart';
import 'package:seach_cep_ddd_flutter/presente/routes/routes.dart';
import 'package:seach_cep_ddd_flutter/presente/screens/home/bindings/binding.dart';
import 'package:seach_cep_ddd_flutter/presente/screens/home/home.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => Home(),
      binding: HomeBinding()
    ),];}