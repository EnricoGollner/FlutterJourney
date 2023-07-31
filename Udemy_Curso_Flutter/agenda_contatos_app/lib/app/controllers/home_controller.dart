import 'package:agenda_contatos_app/app/pages/contact_page.dart';
import 'package:flutter/material.dart';

import '../data/models/contact_model.dart';

class HomePageController {
  HomePageController({required this.context});

  final BuildContext context;

  void showContactPage({ContactModel? contact}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContactPage(
          contact: contact,
        ),
      ),
    );
  }
}
