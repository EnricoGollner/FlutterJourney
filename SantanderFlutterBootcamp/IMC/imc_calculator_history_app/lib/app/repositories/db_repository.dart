import 'package:imc_calculator_history_app/core/util/db_util.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DBRepository {
  ///Scripts to be executed
  Map<int, String> scripts = {
    1: '''
      CREATE TABLE ${DBUtils.imcTable}(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name VARCHAR(100), 
        height REAL, 
        weight REAL, 
        imc REAL, 
        date VARCHAR(20)
      )
''',
  };

  static Database? database;

  Future<Database> getDatabase() async {
    if (database == null) {
      database = await initDatabase();
      return database!;
    }

    return database!;
  }

  Future<Database> initDatabase() async {
    Database db = await openDatabase(
      path.join(await getDatabasesPath(), DBUtils.dbName),
      version: scripts.length,  // Based in the scripts created
      onCreate: (db, version) async {  // SQL executed when creating the database
        for (var i = 1; i < scripts.length; i++) {
          await db.execute(scripts[i]!);
        }
      },
      onUpgrade: (db, oldVersion, newVersion) async {  // Execute the last version
        for (var i = oldVersion + 1; i < scripts.length; i++) {
          await db.execute(scripts[i]!);
        }
      },
    );

    return db;
  }
}