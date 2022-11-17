import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../main.dart';
import '../../app_controller.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  AppController get appController => getIt();

  void toggleDarkTheme(bool state) {
    appController.setDarkTheme(state);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(appController.isDarkThemeProvider).value;

    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Tema Escuro'),
            value: isDarkTheme ?? false,
            onChanged: (state) => toggleDarkTheme(state),
          ),
        ],
      ),
    );
  }
}
