import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'controller/home_controller.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('exemple DDD + TDD'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter your CEP',
                ),
                onChanged: controller.setCep,
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              ()=> Row(
                children: [
                  Text('Rua: '),
                  Expanded(
                    child: Text(controller.rua.value),
                  ),
                ],
              ),
            ),
            Obx(
              ()=> Row(
                children: [
                  Text('Bairro: '),
                  Expanded(
                    child: Text(controller.bairro.value),
                  ),
                ],
              ),
            ),
            Obx(
              ()=> Row(
                children: [
                  Text('Cidade: '),
                  Expanded(
                    child: Text(controller.cidade.value),
                  ),
                ],
              ),
            ),
            Obx(
              ()=> Row(
                children: [
                  Text('Cep: '),
                  Expanded(
                    child: Text(controller.cepcurrent.value),
                  ),
                ],
              ),
            ),
          ]))
    );
  }
}