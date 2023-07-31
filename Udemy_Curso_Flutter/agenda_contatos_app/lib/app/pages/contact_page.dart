import 'package:agenda_contatos_app/app/controllers/contact_controller.dart';
import 'package:agenda_contatos_app/app/widgets/contact_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../data/models/contact_model.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key, this.contact});
  final ContactModel? contact;

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final controller = ContactController();

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final _nameFocus = FocusNode();

  bool userEditted = false;

  late ContactModel _editedContact;

  @override
  void initState() {
    super.initState();
    if (widget.contact == null) {
      _editedContact = ContactModel();
    } else {
      _editedContact = ContactModel.fromMap(widget.contact!.toMap());

      _nameController.text = _editedContact.name;
      _emailController.text = _editedContact.email!;
      _phoneController.text = _editedContact.phone!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => controller.requestPop(context, userEditted),
      child: Scaffold(
        appBar: AppBar(
          title: Text(_editedContact.name),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  ImagePicker()
                      .pickImage(source: ImageSource.camera)
                      .then((file) {
                    if (file == null) {
                      return;
                    } else {
                      setState(() {
                        _editedContact.img = file.path;
                      });
                    }
                  });
                },
                child: ContactImage(
                  contact: _editedContact,
                  width: 140,
                  height: 140,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      focusNode: _nameFocus,
                      decoration: const InputDecoration(labelText: "Name"),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "O nome do contato é obrigatório";
                        }
                        return null;
                      },
                      onChanged: (text) {
                        userEditted = true;
                        setState(() {
                          _editedContact.name = text;
                        });
                      },
                    ),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(labelText: "E-mail"),
                      onChanged: (text) {
                        userEditted = true;
                        _editedContact.email = text;
                      },
                    ),
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(labelText: "Phone"),
                      onChanged: (text) {
                        userEditted = true;
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
          onPressed: () {
            if (_formKey.currentState!.validate() &&
                _editedContact.name.isNotEmpty) {
              Navigator.pop(context,
                  _editedContact); // Retornando contato editado, caso tenha sido editado
            } else {
              FocusScope.of(context).requestFocus(_nameFocus);
            }
          },
          child: const Icon(Icons.save),
        ),
      ),
    );
  }
}
