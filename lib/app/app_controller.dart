import 'package:getit_core_resources/getit_core_resources.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

import '../main.dart';
import 'shared/models/limited_banner.dart';
import 'shared/repositories/banner_repository.dart';

class AppController {
  late final bannerRepository = getIt<BannerRepository>();

  final isDarkThemeProvider = StreamProvider((ref) => rxPrefs.getBoolStream('isDark'));
  final bannersProvider = StreamProvider((ref) => getIt<BannerRepository>()
      .streamAll()
      .map((items) => items.sortedByDescending((e) => e.creationDate)));

  Future<void> setDarkTheme(bool isDark) async {
    await rxPrefs.setBool('isDark', isDark);
  }

  Future<LimitedBanner> createBanner(String name, DateTime creationDate) async {
    final banner = LimitedBanner(name: name, creationDate: creationDate);
    final id = await bannerRepository.insert(banner);
    return banner.copyWith(id: id);
  }

  Future<void> deleteBanner(LimitedBanner banner) async {
    if (banner.id == null) return;
    await bannerRepository.delete(key: banner.id);
  }
}
