import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../main.dart';
import '../../app_controller.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  AppController get appController => getIt();

  void toggleDarkTheme(WidgetRef ref, bool state) {
    ref.read(appController.isDarkThemeProvider.notifier).state = state;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(appController.isDarkThemeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Tema Escuro'),
            value: isDarkTheme,
            onChanged: (state) => toggleDarkTheme(ref, state),
          ),
        ],
      ),
    );
  }
}
