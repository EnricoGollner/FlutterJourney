import 'package:flutter/material.dart';

class CheckboxPage extends StatefulWidget {
  const CheckboxPage({super.key});

  @override
  State<CheckboxPage> createState() => _CheckBoxPageState();
}

class _CheckBoxPageState extends State<CheckboxPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkbox Widget"),
      ),
      body: Center(
        child: Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: Colors.purple,
            ),
            child: Column(
              children: [
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text("Título"),
                  subtitle: const Text("Sub Título"),
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() => _isChecked = !_isChecked);
                  },
                ),
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() => _isChecked = !_isChecked);
                  },
                  activeColor: Colors.red,
                  checkColor: Colors.blue,
                ),
              ],
            )),
      ),
    );
  }
}
