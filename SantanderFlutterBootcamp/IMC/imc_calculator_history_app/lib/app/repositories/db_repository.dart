import 'package:imc_calculator_history_app/core/util/db_util.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLiteDBRepository {
  static Database? database;

  Future<Database> getDatabase() async {
    if (database == null) {
      return await _initDatabase();
    }

    return database!;
  }

  Future<Database> _initDatabase() async {
    Database db = await openDatabase(
      join(await getDatabasesPath(), DBUtils.dbName),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(DBUtils.createTableQuery);
      },
    );

    return db;
  }
}