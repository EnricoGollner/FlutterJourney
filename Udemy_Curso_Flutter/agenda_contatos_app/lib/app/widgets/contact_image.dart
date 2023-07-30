import 'dart:io';
import 'package:flutter/material.dart';

import '../data/models/contact_model.dart';

class ContactImage extends StatelessWidget {
  const ContactImage({
    super.key,
    required this.contact,
    required this.width,
    required this.height,
  });

  final ContactModel contact;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: contact.img != null
              ? FileImage(File(contact.img!)) as ImageProvider
              : const AssetImage("assets/images/person.png"),
        ),
      ),
    );
  }
}
