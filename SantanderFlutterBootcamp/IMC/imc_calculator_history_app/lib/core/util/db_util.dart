class DBUtils {
  static const String dbName = 'imc_database.db';
  static const String imcTable = "imc_table";

  static Map<int, String> scripts = {
    1: '''
      CREATE TABLE $imcTable (
        id INTEGER PRIMARY KEY AUTO_INCREMENT, 
        name VARCHAR(100), 
        height REAL, 
        weight REAL, 
        imc REAL, 
        date VARCHAR(20)
      );''',
  };
}
