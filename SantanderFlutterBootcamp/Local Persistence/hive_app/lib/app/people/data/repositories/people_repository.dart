import 'package:hive/hive.dart';
import 'package:hive_app/app/people/data/model/person.dart';
import 'package:hive_app/app/utils/hive_db_util.dart';

class PeopleRepository {
  static late Box box;

  static Future<PeopleRepository> load() async {
    if(Hive.isBoxOpen(HiveDB.boxPeople)) {
      box = Hive.box(HiveDB.boxPeople);
    } else {
      box = await Hive.openBox(HiveDB.boxPeople);
    }

    return PeopleRepository._load();
  }

  Future<void> save(List<Person> people) async {
    box.put(HiveDB.peopleListKey, people);
  }

  Future<List<Person>> getList() async {
    return await box.get(HiveDB.peopleListKey) ?? [];
  }

  PeopleRepository._load();
}