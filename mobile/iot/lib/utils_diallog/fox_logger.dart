import 'package:logger/logger.dart';

var logger = FoxLogger();

class FoxLogger {
  final _logger = Logger(
    filter: null,
    output: null,
    level: null,
    printer: PrettyPrinter(
      methodCount: 2, // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided
      lineLength: 120, // width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: false // Should each log print contain a timestamp
    ),
  );

  /// Log a message at level verbose.
  void v(dynamic message) {
    _logger.v(message);
  }

  /// Log a message at level debug.
  void d(dynamic message) {
    _logger.d(message);
  }

  /// Log a message at level info.
  void i(dynamic message) {
    _logger.i(message);
  }

  /// Log a message at level warning.
  void w(dynamic message) {
    _logger.w(message);
  }

  /// Log a message at level error.
  void e(dynamic message) {
    _logger.e(message);
  }
}
