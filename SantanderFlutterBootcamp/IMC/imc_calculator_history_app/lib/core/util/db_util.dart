class DBUtils {
  static const String dbName = 'imc_database.db';
  static const String imcTable = "imc_table";

  static String createTableQuery = "CREATE TABLE ${DBUtils.imcTable}(id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(100), height REAL, weight REAL, imc REAL, date VARCHAR(20));";

}
