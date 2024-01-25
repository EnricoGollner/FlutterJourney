import 'package:flutter/material.dart';
import 'package:local_persistence_with_shared_preferences_app/app/controller/generate_numbers_controller.dart';
import 'package:provider/provider.dart';

class RandomNumbersPage extends StatefulWidget {
  const RandomNumbersPage({super.key});

  @override
  State<RandomNumbersPage> createState() => _RandomNumbersPageState();
}

class _RandomNumbersPageState extends State<RandomNumbersPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<GenerateNumberController>(context, listen: false).getLastSavedNumber().then((errorMessage) {
        if (errorMessage.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Numbers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async => await Provider.of<GenerateNumberController>(context, listen: false).generateAndSavenumber(),
              child: const Text('Generate Number'),
            ),
            Expanded(
              child: Text(Provider.of<GenerateNumberController>(context, listen: true).lastGeneratedNumber.toString())
            ),
            Expanded(
              flex: 3,
              child: ListView.builder(
                itemCount: Provider.of<GenerateNumberController>(context).generatedNumbersList.length,
                itemBuilder: (context, index) {
                  final List<int> numbersList = Provider.of<GenerateNumberController>(context).generatedNumbersList;

                  return ListTile(
                    title: Text(numbersList[index].toString()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
