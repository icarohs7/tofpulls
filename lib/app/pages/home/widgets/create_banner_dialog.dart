import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getit_core_resources/getit_core_resources.dart';

import '../../../../main.dart';
import '../../../app_controller.dart';

class CreateBannerDialog extends HookWidget {
  final bannerKey = GlobalKey<FormFieldState>();

  AppController get appController => getIt();

  Future<void> addBanner(BuildContext context, String text) async {
    if (bannerKey.currentState?.validate() == false) return;
    final banner = await appController.createBanner(text);
    Navigator.pop(context, banner);
  }

  @override
  Widget build(BuildContext context) {
    final bannerNameController = useTextEditingController();

    return AlertDialog(
      title: Text('Adicionar Banner'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            key: bannerKey,
            controller: bannerNameController,
            validator: requiredValidator(),
            decoration: InputDecoration(labelText: 'Nome do Banner'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: () => addBanner(context, bannerNameController.text),
          child: Text('Confirmar'),
        ),
      ],
    );
  }
}
