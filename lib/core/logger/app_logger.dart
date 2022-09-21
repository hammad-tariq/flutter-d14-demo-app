import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import 'base_logger.dart';

class AppLogger extends AbstractLogger {
  final Logger logger;

  AppLogger({required this.logger});

  @override
  void d(String message) {
    logger.log(Level.debug, message);
  }

  @override
  void e(Object error, StackTrace? stackTrace) {
    logger.log(Level.error, error);
    debugPrintStack();
    logger.log(Level.error, 'Stack trace body end.');

    FirebaseCrashlytics.instance.recordFlutterError(
        FlutterErrorDetails(exception: error, stack: stackTrace));
  }

  @override
  void w(String message) {
    logger.log(Level.warning, message);
  }

  @override
  void i(String message) {
    logger.log(Level.info, message);
  }
}
