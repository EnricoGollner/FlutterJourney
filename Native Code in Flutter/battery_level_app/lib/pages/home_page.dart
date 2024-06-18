import 'package:battery_level_app/controllers/battery_channel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BatteryChannel _channel = BatteryChannel();
  String batteryLevelLabel = 'Battery is not started yet!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery Level'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(batteryLevelLabel),
          ElevatedButton(onPressed: () async => _getBatteryLevel(), child: const Text('Update')),
          StreamBuilder(stream: _channel.stream, builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text('Battery is ${snapshot.data}%');
            } else {
              return const Text('Battery is not started yet!');
            }
          },)
        ],
      ),)
    );
  }

  Future<void> _getBatteryLevel() async {
    final int? batteryLevel = await _channel.getBatteryLevel();

    setState(() {
      batteryLevelLabel = 'Battery is $batteryLevel%';
    });
  }
}
