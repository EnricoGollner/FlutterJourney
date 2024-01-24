import 'package:imc_calculator_history_app/app/models/person_imc.dart';
import 'package:imc_calculator_history_app/app/repositories/db_repository.dart';
import 'package:imc_calculator_history_app/core/util/db_util.dart';
import 'package:sqflite/sqflite.dart';

abstract class IPersonIMCRepository {
  Future<void> saveIMC({required PersonIMC personIMC});
  Future<List<PersonIMC>> getIMCs();
  Future<void> updateIMC({required PersonIMC personIMC});
  Future<void> deleteIMC({required int id});
}

class PersonIMCRepository implements IPersonIMCRepository{
  @override
  Future<void> saveIMC({required PersonIMC personIMC}) async{
    final Database db = await DBRepository().getDatabase();
    await db.rawInsert('INSERT INTO ${DBUtils.imcTable} (height, weight, imc, date) VALUES (?, ?, ?, ?, ?)', [personIMC.height, personIMC.weight, personIMC.imc, personIMC.date]);
    // db.insert(DBUtils.imcTable, personIMC.toJson());
  }

  @override
  Future<List<PersonIMC>> getIMCs() async {
    final Database db = await DBRepository().getDatabase();
    List<PersonIMC> iMCsList = List<PersonIMC>.empty();

    await db.query('SELECT * FROM ${DBUtils.imcTable}').then((json) => {
      iMCsList.addAll(json.map((e) => PersonIMC.fromJson(e)).toList())
    });

    return iMCsList;
  }

  @override
  Future<void> updateIMC({required PersonIMC personIMC}) async {
    final Database db = await DBRepository().getDatabase();

    await db.rawUpdate('UPDATE ${DBUtils.imcTable} SET height = ?, weight = ?, imc = ?, date = ? WHERE id = ?', [personIMC.height, personIMC.weight, personIMC.imc, personIMC.date, personIMC.id]);
  }

    @override
  Future<void> deleteIMC({required int id}) async {
    final Database db = await DBRepository().getDatabase();
    await db.rawDelete('DELETE ${DBUtils.imcTable} WHERE id = ?', [id]);

    // Another way of deleting:
    //db.delete(DBUtils.imcTable, where: 'id = ?', whereArgs: [id]);
  }
  
}