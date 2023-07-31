import 'package:agenda_contatos_app/app/controllers/home_controller.dart';
import 'package:agenda_contatos_app/app/data/helpers/contact_helper.dart';
import 'package:agenda_contatos_app/app/data/models/contact_model.dart';

import 'package:flutter/material.dart';

import '../widgets/contact_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ContactHelper helper = ContactHelper();
  List<ContactModel> contactsList = [];

  @override
  void initState() {
    super.initState();

    helper.getAllContacts().then((list) {
      setState(() {
        contactsList = list ?? [];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final HomePageController controller = HomePageController(context: context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contatos"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: contactsList.length,
        itemBuilder: (context, index) {
          final ContactModel currentContact = contactsList[index];

          return ContactCard(
            controller: controller,
            contact: currentContact,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.showContactPage();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
