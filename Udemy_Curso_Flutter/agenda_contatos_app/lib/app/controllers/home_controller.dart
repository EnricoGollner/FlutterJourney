import 'package:agenda_contatos_app/app/data/helpers/contact_helper.dart';
import 'package:agenda_contatos_app/app/pages/contact_page.dart';
import 'package:flutter/material.dart';

import '../data/models/contact_model.dart';

class HomePageController extends ChangeNotifier {
  HomePageController({required this.helper});

  final ContactHelper helper;

  final contactsList = ValueNotifier([]);

  void getContacts() {
    helper.getAllContacts().then((list) {
      contactsList.value = list ?? [];
      notifyListeners();
    });
  }

  void showContactPage({
    required BuildContext context,
    ContactModel? contact,
  }) async {
    final ContactModel? reqContact = await Navigator.push(
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
        // se enviamos um contato, ou seja, estamos editando
        await helper.updateContact(reqContact);
      } else {
        // se não estiver editando:
        await helper.saveContact(reqContact);
      }
      getContacts();
    }
  }

  void showOtptionsToContact(BuildContext context, int index) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
              onClosing: () {},
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Ligar",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            showContactPage(
                              context: context,
                              contact: contactsList.value[index],
                            );
                          },
                          child: const Text(
                            "Editar",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextButton(
                          onPressed: () {
                            helper.deleteContactById(
                                contactsList.value[index].id);
                            contactsList.value.removeAt(index);
                            Navigator.pop(context);
                            getContacts();
                          },
                          child: const Text(
                            "Excluir",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              });
        });
  }
}
