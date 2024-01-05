import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tela Inicial'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Iniciar',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50)),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/to-do');
                    // Navigator.pushReplacementNamed(context, '/to-do');
                  },
                  icon: const Icon(Icons.start),
                  color: Colors.white,
                ),
              )
            ],
          ),
        ));
  }
}
