import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';

import 'base_logger.dart';

class FirebaseLogger extends AbstractLogger {
  late final FirebaseCrashlytics _crashlytics;

  FirebaseLogger() {
    _crashlytics = FirebaseCrashlytics.instance;
  }

  @override
  void d(String message) {
    _crashlytics.log('(D) $message');
  }

  @override
  void e(Object error, StackTrace? stackTrace) {
    _crashlytics.recordFlutterError(
        FlutterErrorDetails(exception: error, stack: stackTrace));
  }

  @override
  void w(String message) {
    _crashlytics.log('(W) $message');
  }

  @override
  void i(String message) {
    _crashlytics.log('(I) $message');
  }
}
