class SocialMediaConstants {
  SocialMediaConstants._();

  static const int maxLinks = 4;

  static final Map<String, RegExp> platformPatterns = {
    'facebook': RegExp(r'^(facebook\.com|fb\.com)$'),
    'instagram': RegExp(r'^(instagram\.com|ig\.com)$'),
    'twitter': RegExp(r'^(twitter\.com|x\.com)$'),
    'linkedin': RegExp(r'^linkedin\.com$'),
    'youtube': RegExp(r'^(youtube\.com|youtu\.be)$'),
    'tiktok': RegExp(r'^tiktok\.com$'),
    'pinterest': RegExp(r'^pinterest\.com$'),
    'snapchat': RegExp(r'^snapchat\.com$'),
    'telegram': RegExp(r'^(t\.me|telegram\.org)$'),
    'whatsapp': RegExp(r'^(wa\.me|whatsapp\.com)$'),
    'discord': RegExp(r'^discord\.(gg|com)$'),
    'reddit': RegExp(r'^reddit\.com$'),
    'github': RegExp(r'^github\.com$'),
    'maps': RegExp(r'^(maps\.google\.com|goo\.gl/maps)$'),
  };

  static const Map<String, String> platformLabels = {
    'facebook': 'Facebook URL',
    'instagram': 'Instagram URL',
    'twitter': 'Twitter/X URL',
    'linkedin': 'LinkedIn URL',
    'youtube': 'YouTube URL',
    'tiktok': 'TikTok URL',
    'pinterest': 'Pinterest URL',
    'snapchat': 'Snapchat URL',
    'telegram': 'Telegram URL',
    'whatsapp': 'WhatsApp URL',
    'discord': 'Discord URL',
    'reddit': 'Reddit URL',
    'github': 'GitHub URL',
    'maps': 'Google Maps URL',
    'website': 'Website URL',
  };
}
