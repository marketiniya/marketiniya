enum FileType {
  pdf('pdf'),
  txt('txt'),
  image('image'),
  video('video');

  const FileType(this.value);

  final String value;

  /// Get display name for UI
  String get displayName {
    switch (this) {
      case FileType.pdf:
        return 'PDF';
      case FileType.txt:
        return 'TXT';
      case FileType.image:
        return 'Image';
      case FileType.video:
        return 'Video';
    }
  }

  /// Get file type from string value
  static FileType? fromString(String value) {
    for (final type in FileType.values) {
      if (type.value == value.toLowerCase()) {
        return type;
      }
    }
    return null;
  }
}
