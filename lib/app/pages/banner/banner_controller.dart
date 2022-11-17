import 'package:getit_core_resources/getit_core_resources.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../main.dart';
import '../../shared/models/limited_banner.dart';
import '../../shared/repositories/banner_repository.dart';

final bannerProvider = StreamProvider.autoDispose.family((ref, int key) {
  return getIt<BannerRepository>().streamSingle(key);
});

final bannerControllerProvider = Provider.autoDispose.family((ref, LimitedBanner initialBanner) {
  final banner = ref.watch(bannerProvider(initialBanner.id ?? 0)).value ?? initialBanner;
  final limitedPulls = banner.limitedPulls.length;
  final standardPulls = banner.standardBannerCharacters.values.flatMap((e) => e.pulls).length;

  return BannerController(banner: banner, limitedPulls: limitedPulls, standardPulls: standardPulls);
});

class BannerController {
  final bannerRepository = getIt<BannerRepository>();

  BannerController({
    required this.banner,
    required this.limitedPulls,
    required this.standardPulls,
  });

  final LimitedBanner banner;
  final int limitedPulls;
  final int standardPulls;

  Future<void> pull(LimitedBanner banner, int numberOfPulls) async {
    await bannerRepository.insert(banner.copyWith(
      pulls: banner.pulls + numberOfPulls,
    ));
  }

  Future<void> pullLimitedSsr(LimitedBanner banner) async {
    await bannerRepository.insert(banner.copyWith(
      limitedPulls: banner.limitedPulls + [SsrPull(pullNumber: banner.pulls)],
    ));
  }

  Future<void> pullStandardSsr(LimitedBanner banner, String characterKey) async {
    final character = banner.standardBannerCharacters[characterKey];
    if (character == null) return;
    await bannerRepository.insert(banner.copyWith(
      standardBannerCharacters: {
        ...banner.standardBannerCharacters,
        characterKey: character.copyWith(
          pulls: character.pulls + [SsrPull(pullNumber: banner.pulls)],
        ),
      },
    ));
  }
}
