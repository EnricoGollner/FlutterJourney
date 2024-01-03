import 'package:flutter/material.dart';
import 'package:hive_app/app/generated_number/controller/number_controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late NumberController _numberController;

  @override
  void initState() {
    _numberController = NumberController();

    _numberController.addListener(() {
      setState((){});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _numberController.getLastSaved();
    });
    

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('${_numberController.value}'),
      ),
      floatingActionButton: IconButton(onPressed: _numberController.generateNewNumber, icon: const Icon(Icons.add)),
    );
  }
}
