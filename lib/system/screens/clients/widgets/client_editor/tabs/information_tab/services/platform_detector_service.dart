import 'package:marketinya/system/screens/clients/widgets/client_editor/tabs/information_tab/constants/social_media_constants.dart';

class PlatformDetectorService {
  static String detectPlatform(String url) {
    if (url.isEmpty) {
      return 'website';
    }

    final cleanUrl = url.toLowerCase().trim();
    final domainRegex = RegExp(r'^(?:https?://)?(?:www\.)?([^/]+)');
    final match = domainRegex.firstMatch(cleanUrl);

    if (match == null) {
      return 'website';
    }

    var domain = match.group(1) ?? '';
    if (domain.startsWith('www.')) {
      domain = domain.substring(4);
    }

    for (final entry in SocialMediaConstants.platformPatterns.entries) {
      if (entry.value.hasMatch(domain)) {
        return entry.key;
      }
    }

    return 'website';
  }

  static String formatPlatformLabel(String platform, int index) {
    if (platform == 'website') {
      return 'Link ${index + 1}';
    }
    return '${platform.substring(0, 1).toUpperCase()}${platform.substring(1)}';
  }
}
