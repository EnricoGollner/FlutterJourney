import 'package:flutter/material.dart';

class PopUpDialogPage extends StatelessWidget {
  const PopUpDialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modal Bottom Sheet"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text("My Title"),
                      content: const Text("Conteúdo aqui"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("CANCEL"),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("OK"),
                        )
                      ],
                    ));
          },
          child: const Text("Open Pop-up Dialog"),
        ),
      ),
    );
  }
}
