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
    @Default(defaultStandardBannerCharacters)
        Map<String, StandardBannerCharacter> standardBannerCharacters,
  }) = _LimitedBanner;

  factory LimitedBanner.fromJson(Map<String, dynamic> json) => _$LimitedBannerFromJson(json);
}

@freezed
class StandardBannerCharacter with _$StandardBannerCharacter {
  const factory StandardBannerCharacter({
    required String name,
    @Default(0) int obtained,
  }) = _StandardBannerCharacter;

  const StandardBannerCharacter._();

  factory StandardBannerCharacter.fromJson(Map<String, dynamic> json) =>
      _$StandardBannerCharacterFromJson(json);
}

const defaultStandardBannerCharacters = {
  'zero': StandardBannerCharacter(name: 'Zero'),
  'tsubasa': StandardBannerCharacter(name: 'Tsubasa'),
  'shiro': StandardBannerCharacter(name: 'Shiro'),
  'samir': StandardBannerCharacter(name: 'Samir'),
  'meryl': StandardBannerCharacter(name: 'Meryl'),
  'king': StandardBannerCharacter(name: 'KING'),
  'crow': StandardBannerCharacter(name: 'Crow'),
  'huma': StandardBannerCharacter(name: 'Huma'),
  'coco_ritter': StandardBannerCharacter(name: 'Coco Ritter'),
};
