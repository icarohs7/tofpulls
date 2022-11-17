import 'package:flutter/material.dart';
import 'package:getx_core_resources/getx_core_resources.dart';

import '../../../app_controller.dart';
import '../settings/settings_page.dart';

class HomePage extends GetView<AppController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TOF Pulls'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Nav.to.go(context, page: SettingsPage()),
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
