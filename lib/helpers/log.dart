import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

Logger log = Logger(
  filter: XLOLogger(),
  printer: PrettyPrinter(),
);

class XLOLogger extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return !kReleaseMode;
  }

}