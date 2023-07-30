class DBUtils {
  // Impedindo Strings mágicas

  static const String contactsTable = "contactsTable";
  static const String idColumn = "idColumn";
  static const String nameColumn = "nameColumn";
  static const String emailColumn = "emailColumn";
  static const String phoneColumn = "phoneColumn";
  static const String imgColumn = "imgColumn";
  static const String createTableQuery =
      "CREATE TABLE ${DBUtils.contactsTable}("
      "${DBUtils.idColumn} INTEGER PRIMARY KEY, "
      "${DBUtils.nameColumn} VARCHAR(100), "
      "${DBUtils.emailColumn} VARCHAR(100), "
      "${DBUtils.phoneColumn} VARCHAR(100), "
      "${DBUtils.imgColumn} VARCHAR(100)"
      ")";
}
