abstract class AbstractLogger {
  void d(String message);

  void w(String message);

  void e(Object error, StackTrace? stackTrace);

  void i(String message);
}
