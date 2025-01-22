import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Controller extends GetxController {
  var count = 0.obs;

  void increment() {
    count++;
  }
}

class Home extends StatelessWidget {
  Home({super.key});

  final controller = Get.put(Controller());

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('Clicks: ${controller.count}')),
            ElevatedButton(
                onPressed: () {
                  Get.to(Second());
                },
                child: const Text('Next Route'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child:const Icon(Icons.add),
      ),
    );
  }
}

class Second extends StatelessWidget {
  Second({super.key});

  final Controller ctrl = Get.find();

  @override
  Widget build(context) {
    return Scaffold(body: Center(child: Text("${ctrl.count}")));
  }
}
