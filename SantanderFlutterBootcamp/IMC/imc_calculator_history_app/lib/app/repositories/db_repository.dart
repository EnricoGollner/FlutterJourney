import 'package:flutter/material.dart';
import 'package:imc_calculator_history_app/core/util/db_util.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class SQLiteDBRepository {
  static Database? database;

  Future<Database> getDatabase() async {
    if (database == null) {
      return await initDatabase();
    }

    return database!;
  }

  Future<Database> initDatabase() async {
    Database db = await openDatabase(
      path.join(await getDatabasesPath(), DBUtils.dbName),
      version: DBUtils.scripts.length,  // Based in the scripts created
      onCreate: (db, version) async {  // SQL executed when creating the database
        for (var i = 1; i < DBUtils.scripts.length; i++) {
          debugPrint(DBUtils.scripts[i]!);
          await db.execute(DBUtils.scripts[i]!);
        }
      },
      onUpgrade: (db, oldVersion, newVersion) async {  // Execute the last version
        for (var i = oldVersion + 1; i < DBUtils.scripts.length; i++) {
          await db.execute(DBUtils.scripts[i]!);
        }
      },
    );

    return db;
  }
}