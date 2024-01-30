import 'package:agenda_contatos_app/app/data/helpers/contact_helper.dart';
import 'package:agenda_contatos_app/app/pages/contact_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/models/contact_model.dart';

enum OrderOptions { orderaz, orderza }

class HomePageController extends ChangeNotifier {
  HomePageController({required this.helper});

  final ContactHelper helper;

  final ValueNotifier<List<ContactModel>> contactsList = ValueNotifier([]);

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

  void showOtptionsToContact(BuildContext context, contact) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextButton(
                    onPressed: () {
                      makeCall(context, contact);
                    },
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
                        contact: contact,
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
                      helper.deleteContactById(contact.id);
                      contactsList.value.remove(contact);
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
  }

  void makeCall(BuildContext context, ContactModel contact) {
    launchUrl(Uri.parse("tel:${contact.phone}"));
    Navigator.pop(context);
  }

  void orderList(OrderOptions result) {
    final lContacts = contactsList.value;

    switch (result) {
      case OrderOptions.orderaz:
        lContacts.sort((a, b) {
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
        });
        contactsList.value = lContacts.toList();
        break;
      case OrderOptions.orderza:
        lContacts.sort((a, b) {
          return b.name.toLowerCase().compareTo(a.name.toLowerCase());
        });
        contactsList.value = lContacts.toList();
        break;
    }
  }
}
