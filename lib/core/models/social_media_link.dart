import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_media_link.freezed.dart';
part 'social_media_link.g.dart';

@freezed
class SocialMediaLink with _$SocialMediaLink {
  const factory SocialMediaLink({
    required String platform,
    required String url,
  }) = _SocialMediaLink;

  factory SocialMediaLink.fromJson(Map<String, dynamic> json) => _$SocialMediaLinkFromJson(json);
}
