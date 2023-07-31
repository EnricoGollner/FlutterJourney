import 'package:agenda_contatos_app/app/data/helpers/contact_helper.dart';
import 'package:agenda_contatos_app/app/pages/contact_page.dart';
import 'package:flutter/material.dart';

import '../data/models/contact_model.dart';

class HomePageController extends ChangeNotifier {
  HomePageController({required this.helper});

  final ContactHelper helper;

  final contactsList = ValueNotifier([]);

  void showContactPage({
    required BuildContext context,
    ContactModel? contact,
  }) async {
    final reqContact = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContactPage(
          contact: contact,
        ),
      ),
    );

    if (reqContact != null) {
      // se tivermos editado o contato, o mesmo será retornado e armazenado na variável reqContact
      if (contact != null) {
        // enviamos um contato, ou seja, estamos editando
        await helper.updateContact(reqContact);
      } else {
        // se não estiver editando:
        await helper.saveContact(reqContact);
      }
      getContacts();
    }
  }

  void getContacts() {
    helper.getAllContacts().then((list) {
      contactsList.value = list ?? [];
      notifyListeners();
    });
  }
}
