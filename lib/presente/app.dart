import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seach_cep_ddd_flutter/presente/routes/pages.dart';
import 'package:seach_cep_ddd_flutter/presente/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo DDD for Aloese',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.HOME,
      getPages: AppPages.pages,
    );
  }
}
