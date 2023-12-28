import 'package:flutter/material.dart';

class ExpansionTilePage extends StatefulWidget {
  const ExpansionTilePage({super.key});

  @override
  State<ExpansionTilePage> createState() => _ExpansionTilePageState();
}

class _ExpansionTilePageState extends State<ExpansionTilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expansion Tile Widget"),
      ),
      body: ExpansionTile(
        title: const Text(
          "Animals",
          style: TextStyle(fontSize: 24),
        ),
        children: [
          ListTile(
            title: const Text(
              "Dog",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () => _showSnackBar(msg: "Auau"),
          ),
          ListTile(
            title: const Text(
              "Cat",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () => _showSnackBar(msg: "Miau"),
          ),
          ListTile(
            title: const Text(
              "Fish",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () => _showSnackBar(msg: "Glup"),
          ),
        ],
        onExpansionChanged: (isExpanded) => print(isExpanded),
      ),
    );
  }

  void _showSnackBar({required String msg}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: const Duration(milliseconds: 500),
      ),
    );
  }
}
