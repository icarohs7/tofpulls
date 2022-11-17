import 'package:getit_core_resources/getit_core_resources.dart';

import '../models/limited_banner.dart';

class BannerRepository extends BaseRepository<LimitedBanner> {
  BannerRepository()
      : super(db: HiveTDatabase(dbName: 'banners', adapter: (e) => LimitedBanner.fromJson(e)));

  @override
  Future<int> insert(LimitedBanner item, {int? key}) async {
    final id = key ?? item.id ?? await super.insert(item);
    return super.insert(item.copyWith(id: id), key: id);
  }
}
