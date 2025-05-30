import 'dart:io';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class Log {
  static const String _tagDebug = 'DEBUG';
  static const String _tagInfo = 'INFO';
  static const String _tagWarning = 'WARNING';
  static const String _tagError = 'ERROR';
  static const String _logFileName = 'pce_logs.txt';
  static const String _androidDownloadsPath = '/storage/emulated/0/Download';

  static const Map<Level, String> _levelEmojis = {
    Level.debug: '🪲',
    Level.info: '💡',
    Level.warning: '🚧',
    Level.error: '⛔',
  };

  static final _logger = Logger(
    printer: PrettyPrinter(
      colors: true,
      dateTimeFormat: DateTimeFormat.none,
      methodCount: 0,
      noBoxingByDefault: true,
      levelEmojis: _levelEmojis,
    ),
  );

  static File? _logFile;

  static void debug(String message, {String? tag}) {
    _log(message, tag: tag ?? _tagDebug, level: Level.debug);
  }

  static void info(String message, {String? tag}) {
    _log(message, tag: tag ?? _tagInfo, level: Level.info);
  }

  static void warning(String message, {String? tag, dynamic error}) {
    _log(message, tag: tag ?? _tagWarning, level: Level.warning, error: error);
  }

  static void error(String message, {String? tag, dynamic error}) {
    _log(message, tag: tag ?? _tagError, level: Level.error, error: error);
  }

  static Future<void> createLogFile() async {
    try {
      late final Directory? directory;

      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else if (Platform.isAndroid) {
        directory = Directory(_androidDownloadsPath);
      }

      if (directory == null) {
        throw Exception('Downloads directory not found');
      }

      _logFile = File('${directory.path}/$_logFileName');

      if (!await _logFile!.exists()) {
        await _logFile!.create();
        info('Log file successfully created.');
      }
    } catch (e) {
      error('Error creating log file: $e');
    }
  }

  static void _log(String message, {required String tag, required Level level, dynamic error}) {
    final datetime = DateFormat('[dd-MM-yy HH:mm:ss]').format(DateTime.now());
    final logMessage = '$datetime $tag: $message';

    if (_logFile != null) {
      _writeToFile(logMessage);
    }

    switch (level) {
      case Level.info:
        _logger.i(logMessage, error: error);
        break;
      case Level.warning:
        _logger.w(logMessage, error: error);
        break;
      case Level.error:
        _logger.e(logMessage, error: error);
        break;
      default:
        _logger.d(logMessage, error: error);
        break;
    }
  }

  static void _writeToFile(String message) {
    try {
      _logFile!.writeAsStringSync('$message\n', mode: FileMode.append);
    } catch (e) {
      error('Error writing to log file: $e');
    }
  }
}