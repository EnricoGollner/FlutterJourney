import 'package:data_visualization_app/service/app_storage_service.dart';
import 'package:data_visualization_app/shared/widgets/custom_drawer.dart';
import 'package:data_visualization_app/shared/widgets/text_label.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  String _selectedLevel = "";

  List<String> languages = ['Dart', 'Kotlin', 'Swift', 'Java'];
  List<String> _selectedLanguages = [];

  double salaryExpectation = 1000;

  List<String> timeExperienceList = ['3', '4', '5', '6 ou mais'];
  String timeExperience = '3';

  late AppStorageService _appStorageService;

  @override
  void initState() {
    super.initState();
    _appStorageService = AppStorageService();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _loadSavedData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
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
              SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount: levels.length,
                  itemBuilder: (context, index) {
                    return RadioListTile(
                        dense: true,
                        value: levels[index],
                        title: Text(levels[index]),
                        selected: _selectedLevel ==
                            levels[index], // text color showing it's selected
                        groupValue: _selectedLevel, // the circle gets filled
                        onChanged: (value) {
                          setState(() {
                            _selectedLevel = value.toString();
                          });
                        });
                  },
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: languages.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        dense: true,
                        title: Text(languages[index]),
                        value: _selectedLanguages.contains(languages[index]),
                        onChanged: (value) {
                          setState(() {
                            value != null && value
                                ? _selectedLanguages.add(languages[index])
                                : _selectedLanguages.remove(languages[index]);
                          });
                        },
                      );
                    },
                  )),
              const SizedBox(height: 10),
              TextLabel(
                  text: 'Salary Expectation: : ${salaryExpectation.round()}'),
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
              const TextLabel(text: 'Experience time:'),
              DropdownButton(
                isExpanded: true,
                value: timeExperience,
                items: timeExperienceList
                    .map(
                      (time) => DropdownMenuItem(
                        value: time,
                        child: Text(time),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    timeExperience = value as String;
                  });
                },
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () async {
                  if (_birthDate != null) {
                    return _appStorageService.saveAllData(
                      name: _nameController.text,
                      birthDate: _birthDateController.text,
                      experienceLevel: _selectedLevel,
                      languagesExperience: _selectedLanguages,
                    );
                  }

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Verifique os campos e tente novamente!')));
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _loadSavedData() async {
    _nameController.text = await _appStorageService.getName();
    _birthDateController.text = await _appStorageService.getBirthDate();

    String experienceLevel = await _appStorageService.getExperienceLevel();
    List<String> selectedLanguagesList = await _appStorageService.getLanguagesExperience();

    setState(() {
      _selectedLevel = experienceLevel;
      _selectedLanguages = selectedLanguagesList;
    });
  }
}
