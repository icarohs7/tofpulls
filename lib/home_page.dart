import 'package:flutter/material.dart';
import 'package:getx_core_resources/getx_core_resources.dart';

import 'app_controller.dart';

class HomePage extends GetView<AppController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TOF Pulls'),
        centerTitle: true,
        actions: [
          Obx(() {
            final isDark = controller.isDarkTheme.value;

            return IconButton(
              onPressed: () => controller.isDarkTheme.value = !controller.isDarkTheme.value,
              icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            );
          }),
        ],
      ),
      body: Container(),
    );
  }
}
