import 'package:flutter/material.dart';
import 'package:getx_core_resources/getx_core_resources.dart';

import '../../../app_controller.dart';

class SettingsPage extends GetView<AppController> {
  const SettingsPage({super.key});

  void toggleDarkTheme() {
    controller.isDarkTheme.value = !controller.isDarkTheme.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Obx(() {
            final isDarkTheme = controller.isDarkTheme.value;

            return SwitchListTile(
              title: Text('Tema Escuro'),
              value: isDarkTheme,
              onChanged: (v) => toggleDarkTheme(),
            );
          }),
        ],
      ),
    );
  }
}
