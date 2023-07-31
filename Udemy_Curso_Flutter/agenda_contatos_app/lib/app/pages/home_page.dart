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
        centerTitle: true,
        actions: [
          PopupMenuButton<OrderOptions>(
            itemBuilder: (context) {
              return <PopupMenuEntry<OrderOptions>>[
                const PopupMenuItem<OrderOptions>(
                  value: OrderOptions.orderaz,
                  child: Text("Ordenar de A-Z"),
                ),
                const PopupMenuItem<OrderOptions>(
                  value: OrderOptions.orderza,
                  child: Text("Ordenar de Z-A"),
                )
              ];
            },
            onSelected: (value) {
              controller.orderList(value);
            },
          )
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
