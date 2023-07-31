import 'package:agenda_contatos_app/app/widgets/contact_image.dart';
import 'package:flutter/material.dart';

import '../data/models/contact_model.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key, this.contact});
  final ContactModel? contact;

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  bool _userEditted = false;

  late ContactModel _editedContact;

  @override
  void initState() {
    super.initState();
    if (widget.contact == null) {
      _editedContact = ContactModel(name: "Teste");
    } else {
      _editedContact = ContactModel.fromMap(widget.contact!.toMap());

      _nameController.text = _editedContact.name!;
      _emailController.text = _editedContact.email!;
      _phoneController.text = _editedContact.phone!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_editedContact.name ?? "Novo Contato"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            GestureDetector(
              child: ContactImage(
                contact: _editedContact,
                width: 140,
                height: 140,
              ),
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: "Name"),
                    onChanged: (text) {
                      _userEditted = true;
                      setState(() {
                        text.isEmpty
                            ? _editedContact.name = "Novo Contato"
                            : _editedContact.name = text;
                      });
                    },
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(labelText: "E-mail"),
                    onChanged: (text) {
                      _userEditted = true;
                      _editedContact.email = text;
                    },
                  ),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(labelText: "Phone"),
                    onChanged: (text) {
                      _userEditted = true;
                      _editedContact.phone = text;
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save),
      ),
    );
  }
}
