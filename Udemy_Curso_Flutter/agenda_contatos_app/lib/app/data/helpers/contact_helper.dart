import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../utils/db_utils.dart';
import '../models/contact_model.dart';

class ContactHelper {
  // Singleton (Apenas uma instância para toda a aplicação):
  static final ContactHelper _instance = ContactHelper.internal();
  factory ContactHelper() => _instance;
  ContactHelper.internal();

  Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      // caso o db já tenha sido inicializado
      return _db;
    } else {
      _db = await initDB();
      return _db;
    }
  }

  Future<Database?> initDB() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "contacts.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int newerVersion) async {
        await db.execute(DBUtils.createTableQuery);
      },
    );
  }

  Future<ContactModel> saveContact(ContactModel contact) async {
    // INSERT / POST
    Database? dbContacts = await db;
    contact.id =
        await dbContacts?.insert(DBUtils.contactsTable, contact.toMap());
    return contact;
  }

  Future<List<ContactModel>?> getAllContacts() async {
    Database? dbContacts = await db;

    List<Map<String, dynamic>>? listMap =
        await dbContacts?.rawQuery("SELECT * FROM ${DBUtils.contactsTable}");

    if (listMap != null) {
      List<ContactModel> listContacts = listMap
          .map(
            (e) => ContactModel.fromMap(e),
          )
          .toList();

      return listContacts;
    }

    return null;
  }

  Future<ContactModel?> getContactById(int contactId) async {
    // READ by ID
    Database? dbContacts = await db;
    List<Map<String, dynamic>>? maps = await dbContacts?.query(
      DBUtils.contactsTable,
      columns: [
        DBUtils.idColumn,
        DBUtils.nameColumn,
        DBUtils.phoneColumn,
        DBUtils.imgColumn,
      ],
      where:
          "${DBUtils.idColumn} = ?", // a interrogação é preenchida pelo whereArgs (parâmetro seguinte)
      whereArgs: [contactId],
    );
    if (maps != null && maps.isNotEmpty) {
      return ContactModel.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int?> deleteContactById(int contactId) async {
    Database? dbContacts = await db;

    return await dbContacts?.delete(
      // retorna um número inteiro indicando se a deleção ocorreu corretamente.
      DBUtils.contactsTable,
      where: "${DBUtils.idColumn} = ?",
      whereArgs: [contactId],
    );
  }

  Future<int?> updateContact(ContactModel contact) async {
    Database? dbContacts = await db;

    return await dbContacts?.update(
      // retorna inteiro indicando se foi sucesso.
      DBUtils.contactsTable,
      contact.toMap(),
      where: "${DBUtils.idColumn} = ?",
      whereArgs: [contact.id],
    );
  }

  Future<int?> getNumber() async {
    Database? dbContacts = await db;

    if (dbContacts != null) {
      return Sqflite.firstIntValue(
        await dbContacts.rawQuery(
          "SELECT COUNT(*) FROM ${DBUtils.contactsTable}",
        ),
      );
    }

    return null;
  }

  Future<void> close() async {
    Database? dbContacts = await db;
    dbContacts?.close();
  }
}
