import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getit_core_resources/getit_core_resources.dart';

import 'app/app_controller.dart';
import 'routes.dart';

final getIt = GetIt.I;

// ignore: avoid_void_async
void main() async {
  await setup();
  runApp(ProviderScope(child: const AppWidget()));
}

Future<void> setup() async {
  await HiveDbResources.init().orNull();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).orNull();

  //Controllers
  getIt.registerLazySingleton(() => AppController());
  //Repositories
  //Services
  //Others
}

class AppWidget extends ConsumerWidget {
  const AppWidget({Key? key}) : super(key: key);

  AppController get controller => getIt();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(controller.isDarkThemeProvider);

    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: routes,
      debugShowCheckedModeBanner: false,
      title: 'TOF Pulls',
      theme: ThemeData(
        useMaterial3: true,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
    );
  }
}
