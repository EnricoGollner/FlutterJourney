import 'package:flutter/material.dart';

class DropdownMenuPage extends StatefulWidget {
  const DropdownMenuPage({super.key});

  @override
  State<DropdownMenuPage> createState() => _DropdownMenuPageState();
}

class _DropdownMenuPageState extends State<DropdownMenuPage> {
  final List<String> _items = ["Item 1", "Item 2", "Item 3", "Item 4"];
  String? _selectedItem = "Item 1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dropdown Menu"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _basicDropDownMenu(),
            SizedBox(
              width: 240,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(width: 3, color: Colors.purple),
                  ),
                ),
                value: _selectedItem,
                items: _items
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (item) => setState(() => _selectedItem = item),
              ),
            )
          ],
        ),
      ),
    );
  }

  DropdownButton<String> _basicDropDownMenu() {
    return DropdownButton<String>(
      value: _selectedItem,
      items: _items
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          )
          .toList(),
      onChanged: (item) => setState(() => _selectedItem = item),
    );
  }
}
