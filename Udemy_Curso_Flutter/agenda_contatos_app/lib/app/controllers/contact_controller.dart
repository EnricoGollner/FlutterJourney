import 'package:flutter/material.dart';

class ContactController {
  Future<bool> requestPop(BuildContext context, bool edditedUser) {
    if (edditedUser) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Descartar Alterações?"),
              content: const Text("Se sair, as alterações serão perdidas!"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancelar"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // sair da alert
                    Navigator.pop(context); // sair da ContactPage
                  },
                  child: const Text("Sair"),
                )
              ],
            );
          });
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
