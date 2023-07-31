import 'package:agenda_contatos_app/app/controllers/home_controller.dart';
import 'package:agenda_contatos_app/app/widgets/contact_image.dart';
import 'package:flutter/material.dart';

import '../data/models/contact_model.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.controller,
    required this.contact,
  });
  final HomePageController controller;
  final ContactModel contact;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                ContactImage(
                  contact: contact,
                  width: 80,
                  height: 80,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact.name ?? "",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        contact.email ?? "",
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        contact.phone ?? "",
                        style: const TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
      onTap: () {
        controller.showContactPage(contact: contact);
      },
    );
  }
}
