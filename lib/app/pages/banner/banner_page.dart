import 'package:flutter/material.dart' hide Banner;

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
      ),
      body: Container(),
    );
  }
}
