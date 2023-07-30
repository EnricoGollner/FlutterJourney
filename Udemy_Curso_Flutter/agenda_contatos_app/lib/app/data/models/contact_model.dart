import 'package:agenda_contatos_app/app/utils/db_utils.dart';

class ContactModel {
  int? id;
  String name;
  String email;
  String phone;
  String img;

  ContactModel.fromMap(Map<String, dynamic> map)
      : id = map[DBUtils.idColumn],
        name = map[DBUtils.nameColumn],
        email = map[DBUtils.emailColumn],
        phone = map[DBUtils.phoneColumn],
        img = map[DBUtils.imgColumn];

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      DBUtils.nameColumn: name,
      DBUtils.emailColumn: email,
      DBUtils.phoneColumn: phone,
      DBUtils.imgColumn: img,
    };

    if (id != null) map[DBUtils.idColumn] = id;

    return map;
  }

  @override
  String toString() {
    return "Contato: id: $id, name: $name, email: $email, phone: $phone, img: $img";
  }
}
