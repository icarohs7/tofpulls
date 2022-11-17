import 'package:beamer/beamer.dart';

import 'app/pages/banner/banner_page.dart';
import 'app/pages/home/home_page.dart';
import 'app/pages/settings/settings_page.dart';
import 'app/shared/models/limited_banner.dart';

final routes = BeamerDelegate(
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '/': (context, state, data) => HomePage(),
      '/banner': (context, state, data) => BannerPage(banner: data as LimitedBanner),
      '/settings': (context, state, data) => SettingsPage(),
    },
  ),
);
