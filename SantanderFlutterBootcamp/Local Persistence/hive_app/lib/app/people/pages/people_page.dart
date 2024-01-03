import 'package:flutter/material.dart';
import 'package:hive_app/app/people/controller/people_controller.dart';
import 'package:hive_app/app/people/data/model/person.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({super.key});

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  late PeopleController _peopleController;

  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    _peopleController = PeopleController();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _peopleController.getPeople();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('Hive - People List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextField(controller: _nameController)),
                ElevatedButton(
                  onPressed: () =>
                      _peopleController.addPerson(_nameController.text),
                  child: const Icon(Icons.add),
                )
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
                child: ValueListenableBuilder<List<Person>>(
                    valueListenable: _peopleController,
                    builder: (context, value, child) {
                      return ListView.builder(
                        itemCount: _peopleController.value.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(_peopleController.value[index].name),
                          );
                        },
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
