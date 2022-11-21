import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:getit_core_resources/getit_core_resources.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../main.dart';
import '../../app_controller.dart';
import '../../shared/models/limited_banner.dart';
import 'widgets/create_banner_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> createBanner(BuildContext context) async {
    final banner = await showDialog<LimitedBanner?>(
      context: context,
      builder: (context) => CreateBannerDialog(),
    );
    if (banner != null) context.beamToNamed('/banner', data: banner);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TOF Pulls'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => context.beamToNamed('/settings'),
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: _HomeBody(),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Adicionar Banner'),
        onPressed: () => createBanner(context),
      ),
    );
  }
}

class _HomeBody extends ConsumerWidget {
  late final appController = getIt<AppController>();

  Future<void> editItem(BuildContext context, LimitedBanner banner) async {
    await showDialog(
      context: context,
      builder: (context) => CreateBannerDialog(banner: banner),
    );
  }

  Future<void> deleteItem(BuildContext context, LimitedBanner banner) async {
    await appController.deleteBanner(banner);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(appController.bannersProvider);

    if (items.isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    final Iterable<LimitedBanner> banners = items.value ?? [];
    final bannerCount = banners.length;

    if (banners.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            'Nenhum banner criado',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: bannerCount,
      itemBuilder: (context, index) {
        final banner = banners.elementAt(index);

        return DismissibleFromEndToStart(
          itemKey: ValueKey(banner.id),
          onDismissed: () => deleteItem(context, banner),
          confirmDismiss: () => showConfirmDialog(
            context,
            title: Text('Confirmar exclusão do banner ${banner.name}?'),
          ),
          child: ListTile(
            title: Text(banner.name),
            subtitle: Row(
              children: [
                Expanded(
                  child: Text('Tiros: ${banner.pulls}'),
                ),
                Text(banner.creationDate.string('dd/MM/yyyy')),
              ],
            ),
            onTap: () => context.beamToNamed('/banner', data: banner),
            onLongPress: () => editItem(context, banner),
          ),
        );
      },
    );
  }
}
