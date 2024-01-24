import 'package:imc_calculator_history_app/app/models/person_imc.dart';
import 'package:imc_calculator_history_app/app/repositories/db_repository.dart';
import 'package:imc_calculator_history_app/core/util/db_util.dart';
import 'package:sqflite/sqflite.dart';

abstract class IPersonIMCRepository {
  Future<List<PersonIMC>> saveIMC({required PersonIMC personIMC});
  Future<List<PersonIMC>> getIMCs();
  Future<List<PersonIMC>> updateIMC({required PersonIMC personIMC});
  Future<List<PersonIMC>> deleteIMC({required int id});
}

class PersonIMCRepository implements IPersonIMCRepository{
  final SQLiteDBRepository _dbRepository = SQLiteDBRepository();
  final List<PersonIMC> iMCsList = [];

  @override
  Future<List<PersonIMC>> saveIMC({required PersonIMC personIMC}) async{
    final Database db = await _dbRepository.getDatabase();
    await db.rawInsert('INSERT INTO ${DBUtils.imcTable} (height, weight, imc, date) VALUES (?, ?, ?, ?, ?)', [personIMC.height, personIMC.weight, personIMC.imc, personIMC.date]);
    iMCsList.add(personIMC);

    return iMCsList;
  }

  @override
  Future<List<PersonIMC>> getIMCs() async {
    final Database db = await _dbRepository.getDatabase();
    await db.rawQuery('SELECT * FROM ${DBUtils.imcTable}').then((json) => {
      iMCsList.addAll(json.map((e) => PersonIMC.fromJson(e)).toList())
    });

    return iMCsList;
  }

  @override
  Future<List<PersonIMC>> updateIMC({required PersonIMC personIMC}) async {
    final Database db = await _dbRepository.getDatabase();

    await db.rawUpdate('UPDATE ${DBUtils.imcTable} SET height = ?, weight = ?, imc = ?, date = ? WHERE id = ?', [personIMC.height, personIMC.weight, personIMC.imc, personIMC.date, personIMC.id]);
    final int index = iMCsList.indexOf(personIMC);
    iMCsList.replaceRange(index, index, [personIMC]);

    return iMCsList;
  }

    @override
  Future<List<PersonIMC>> deleteIMC({required int id}) async {
    final Database db = await _dbRepository.getDatabase();
    await db.rawDelete('DELETE ${DBUtils.imcTable} WHERE id = ?', [id]);
    iMCsList.removeWhere((personIMC) => personIMC.id == id);

    return iMCsList;
  }
  
}