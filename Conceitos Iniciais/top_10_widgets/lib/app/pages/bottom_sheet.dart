import 'package:flutter/material.dart';

class ModalBootomSheet extends StatelessWidget {
  const ModalBootomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modal Bottom Sheet"),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.yellow,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              top: Radius.circular(40),
            )),
            builder: (context) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const FlutterLogo(size: 120),
                  const SizedBox(height: 20),
                  const FlutterLogo(size: 120),
                  const SizedBox(height: 20),
                  const FlutterLogo(size: 120),
                  const SizedBox(height: 20),
                  const FlutterLogo(size: 120),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Close"),
                  )
                ],
              ),
            ),
          );
        },
        child: const Text("Open Bottom Sheet"),
      )),
    );
  }
}
