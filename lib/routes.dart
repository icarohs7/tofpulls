import 'package:beamer/beamer.dart';

import 'app/shared/pages/home/home_page.dart';
import 'app/shared/pages/settings/settings_page.dart';

final routes = BeamerDelegate(
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '/': (context, state, data) => HomePage(),
      '/settings': (context, state, data) => SettingsPage(),
    },
  ),
);
