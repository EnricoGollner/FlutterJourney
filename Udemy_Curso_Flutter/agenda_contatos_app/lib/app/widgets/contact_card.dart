import 'package:agenda_contatos_app/app/widgets/contact_image.dart';
import 'package:flutter/material.dart';

import '../data/models/contact_model.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.currentContact,
  });

  final ContactModel currentContact;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                ContactImage(
                  contact: currentContact,
                  width: 80,
                  height: 80,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentContact.name ?? "",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        currentContact.email ?? "",
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        currentContact.phone ?? "",
                        style: const TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
