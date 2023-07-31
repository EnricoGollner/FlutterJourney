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
  late final HomePageController controller;
  List<ContactModel> contactsList = [];

  @override
  void initState() {
    super.initState();

    controller = HomePageController(helper: helper);

    controller.getContacts();
  }

  @override
  Widget build(BuildContext context) {
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
      body: ValueListenableBuilder(
        valueListenable: controller.contactsList,
        builder: (BuildContext context, value, Widget? child) {
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: value.length,
            itemBuilder: (context, index) {
              final ContactModel currentContact = value[index];

              return ContactCard(
                controller: controller,
                contact: currentContact,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.showContactPage(context: context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
