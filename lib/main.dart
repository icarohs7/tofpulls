import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getx_core_resources/getx_core_resources.dart';

import 'app_controller.dart';
import 'home_page.dart';

// ignore: avoid_void_async
void main() async {
  await setup();
  runApp(const AppWidget());
}

Future<void> setup() async {
  await HiveDbResources.init().orNull();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).orNull();

  //Controllers
  Get.putSingleton(AppController());
  //Repositories
  //Services
  //Others
}

class AppWidget extends GetView<AppController> {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDarkTheme = controller.isDarkTheme.value;

      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        title: 'TOF Pulls',
        theme: ThemeData(
          useMaterial3: true,
          brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        ),
        defaultTransition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 300),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('pt', 'BR')],
      );
    });
  }
}
