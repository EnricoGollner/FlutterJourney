import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:widgets_interacao/widgets/text_label.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController(text: '');
  final TextEditingController _birthDateController =
      TextEditingController(text: '');
  DateTime? _birthDate;

  List<String> levels = ['Iniciante', 'Intermediário', 'Avançado'];
  String selectedLevel = "";

  List<String> languages = ['Dart', 'Kotlin', 'Swift', 'Java'];
  List<String> selectedLanguages = [];

  double salaryExpectation = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextLabel(text: 'Name'),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Digite seu nome',
              ),
            ),
            const SizedBox(height: 10),
            const TextLabel(text: 'Birth date'),
            TextField(
              controller: _birthDateController,
              readOnly: true,
              decoration:
                  const InputDecoration(hintText: 'Pick your birth date'),
              onTap: () async {
                DateTime? birthDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime(2000),
                  firstDate: DateTime(1990, 1, 1),
                  lastDate: DateTime(2010, 1, 1),
                );

                if (birthDate != null) {
                  _birthDateController.text =
                      DateFormat('dd/MM/yyyy').format(birthDate);
                  _birthDate = birthDate;
                } else {
                  _birthDateController.text = 'Pick your birth date';
                }
              },
            ),
            const SizedBox(height: 10),
            const TextLabel(text: 'Experience Level'),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: levels.length,
                itemBuilder: (context, index) {
                  return RadioListTile(
                      dense: true,
                      value: levels[index],
                      title: Text(levels[index]),
                      selected: selectedLevel ==
                          levels[index], // text color showing it's selected
                      groupValue: selectedLevel, // the circle gets filled
                      onChanged: (value) {
                        setState(() {
                          selectedLevel = value.toString();
                        });
                      });
                },
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
                child: ListView.builder(
              itemCount: languages.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  dense: true,
                  title: Text(languages[index]),
                  value: selectedLanguages.contains(languages[index]),
                  onChanged: (value) {
                    setState(() {
                      value != null && value
                          ? selectedLanguages.add(languages[index])
                          : selectedLanguages.remove(languages[index]);
                    });
                  },
                );
              },
            )),
            const SizedBox(height: 10),
            TextLabel(text: 'Salary Expectation: : ${salaryExpectation.round()}'),
            Slider(
                min: 0,
                max: 10000,
                divisions: 100,
                value: salaryExpectation,
                onChanged: (double value) {
                  debugPrint(value.round.toString());
                  setState(() {
                    salaryExpectation = value;
                  });
                }),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                if (_birthDate != null) {
                  debugPrint(
                      'Birth Date: ${DateFormat('dd/MM/yyyy').format(_birthDate!)}');
                }
                debugPrint('Nível: $selectedLevel');
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
