import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getit_core_resources/getit_core_resources.dart';

import '../../../../main.dart';
import '../../../app_controller.dart';

class CreateBannerDialog extends HookWidget {
  final bannerKey = GlobalKey<FormFieldState>();

  AppController get appController => getIt();

  Future<void> addBanner(BuildContext context, String text, DateTime creationDate) async {
    if (bannerKey.currentState?.validate() == false) return;
    final banner = await appController.createBanner(text, creationDate);
    Navigator.pop(context, banner);
  }

  @override
  Widget build(BuildContext context) {
    final bannerNameController = useTextEditingController();
    final dateTimeState = useState(DateTime.now());
    final dateTimeController = useTextEditingController(text: DateTime.now().string('dd/MM/yyyy'));

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
            decoration: InputDecoration(labelText: 'Personagem do Banner'),
          ),
          SizedBox(height: 8),
          InkWell(
            onTap: () async {
              final now = DateTime.now();
              final selectedDate = await showDatePicker(
                helpText: 'Data da diária',
                fieldLabelText: 'Informe a data',
                context: context,
                initialDate: dateTimeState.value,
                firstDate: now - 52.weeks,
                lastDate: now + 1.days,
                locale: Locale('pt', 'BR'),
              );
              if (selectedDate == null) return;
              final tripDate = dateTimeState.value;
              dateTimeState.value = tripDate.copyWith(
                day: selectedDate.day,
                month: selectedDate.month,
                year: selectedDate.year,
              );
              dateTimeController.text = selectedDate.string('dd/MM/yyyy');
            },
            child: AbsorbPointer(
              child: TextFormField(
                controller: dateTimeController,
                validator: requiredValidator(),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.today),
                  labelText: 'Data',
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: () => addBanner(context, bannerNameController.text, dateTimeState.value),
          child: Text('Confirmar'),
        ),
      ],
    );
  }
}
