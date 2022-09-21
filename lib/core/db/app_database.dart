import 'package:sqflite/sqflite.dart';

import '../logger/app_logger.dart';

class AppDatabase {
  final Database? database;
  final AppLogger? logger;

  // late Batch? batch;

  AppDatabase({
    required this.database,
    required this.logger,
  }) : super();

  /*
  * Close open database connection.
  * */
  Future close() async {
    database?.close();
  }
}
