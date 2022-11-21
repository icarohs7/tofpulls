import 'package:flutter/material.dart' hide Banner;
import 'package:getit_core_resources/getit_core_resources.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/models/limited_banner.dart';
import 'banner_controller.dart';

class BannerPage extends ConsumerWidget {
  const BannerPage({super.key, required LimitedBanner banner}) : initialBanner = banner;

  final LimitedBanner initialBanner;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(bannerControllerProvider(initialBanner));
    final banner = controller.banner;
    final limitedPulls = controller.limitedPulls;
    final standardPulls = controller.standardPulls;
    final ssrPulls = limitedPulls + standardPulls;

    return Scaffold(
      appBar: AppBar(
        title: Text(banner.name),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            title: Text(
              'Tiros Realizados: ${banner.pulls}',
              textAlign: TextAlign.center,
              style: context.headline6,
            ),
          ),
          ListTile(
            title: Text(
              'Armas do Banner Obtidas: $limitedPulls',
              textAlign: TextAlign.center,
              style: context.headline6,
            ),
            subtitle: Text(
              'SSRs Obtidos: $ssrPulls',
              textAlign: TextAlign.center,
            ),
          ),
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            children: [
              ...banner.standardBannerCharacters.entries.map((entry) {
                final key = entry.key;
                final character = entry.value;

                return InkWell(
                  onTap: () => controller.pullStandardSsr(banner, key),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: AssetImage('assets/images/$key.webp'),
                          width: 72,
                        ),
                        Text('${character.pulls.length}x', style: context.headline6),
                      ],
                    ),
                  ),
                );
              })
            ],
          ),
          Spacer(),
          Center(
            child: ElevatedButton(
              child: Text('Marcar Obtenção de Arma do Banner'),
              onPressed: () => controller.pullLimitedSsr(banner),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: Text('Atirar 1x'),
                    onPressed: () => controller.pull(banner, 1),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    child: Text('Atirar 10x'),
                    onPressed: () => controller.pull(banner, 10),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
