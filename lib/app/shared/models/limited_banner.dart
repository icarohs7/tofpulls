import 'package:freezed_annotation/freezed_annotation.dart';

part 'limited_banner.freezed.dart';
part 'limited_banner.g.dart';

@freezed
class LimitedBanner with _$LimitedBanner {
  const factory LimitedBanner({
    int? id,
    required String name,
    required DateTime creationDate,
    @Default(0) int pulls,
    @Default(<SsrPull>[]) List<SsrPull> limitedPulls,
    @Default(defaultStandardBannerCharacters)
        Map<String, StandardBannerCharacter> standardBannerCharacters,
  }) = _LimitedBanner;

  factory LimitedBanner.fromJson(Map<String, dynamic> json) => _$LimitedBannerFromJson(json);
}

@freezed
class StandardBannerCharacter with _$StandardBannerCharacter {
  const factory StandardBannerCharacter({
    required String id,
    required String name,
    @Default(<SsrPull>[]) List<SsrPull> pulls,
  }) = _StandardBannerCharacter;

  const StandardBannerCharacter._();

  factory StandardBannerCharacter.fromJson(Map<String, dynamic> json) =>
      _$StandardBannerCharacterFromJson(json);
}

const defaultStandardBannerCharacters = {
  'zero': StandardBannerCharacter(id: 'zero', name: 'Zero'),
  'tsubasa': StandardBannerCharacter(id: 'tsubasa', name: 'Tsubasa'),
  'shiro': StandardBannerCharacter(id: 'shiro', name: 'Shiro'),
  'samir': StandardBannerCharacter(id: 'samir', name: 'Samir'),
  'meryl': StandardBannerCharacter(id: 'meryl', name: 'Meryl'),
  'king': StandardBannerCharacter(id: 'king', name: 'KING'),
  'crow': StandardBannerCharacter(id: 'crow', name: 'Crow'),
  'huma': StandardBannerCharacter(id: 'huma', name: 'Huma'),
  'coco_ritter': StandardBannerCharacter(id: 'coco_ritter', name: 'Coco Ritter'),
};

@freezed
class SsrPull with _$SsrPull {
  const factory SsrPull({
    required int pullNumber,
  }) = _SsrPull;

  factory SsrPull.fromJson(Map<String, dynamic> json) => _$SsrPullFromJson(json);
}
