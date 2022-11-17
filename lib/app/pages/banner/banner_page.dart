import 'package:flutter/material.dart' hide Banner;
import 'package:getit_core_resources/getit_core_resources.dart';

import '../../shared/models/limited_banner.dart';

class BannerPage extends StatelessWidget {
  const BannerPage({super.key, required this.banner});

  final LimitedBanner banner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(banner.name),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.ssid_chart),
          ),
        ],
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
              'Armas do Banner Obtidas: 0x',
              textAlign: TextAlign.center,
              style: context.headline6,
            ),
            subtitle: Text(
              'SSRs Obtidos: 0',
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
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: AssetImage('assets/images/$key.webp'),
                          width: 72,
                        ),
                        Text('${character.obtained}x', style: context.headline6),
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
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: Text('Atirar 1x'),
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    child: Text('Atirar 10x'),
                    onPressed: () {},
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
