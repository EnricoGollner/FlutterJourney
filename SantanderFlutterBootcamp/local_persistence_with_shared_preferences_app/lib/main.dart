import 'package:flutter/material.dart';
import 'package:local_persistence_with_shared_preferences_app/app/controller/generate_numbers_controller.dart';
import 'package:local_persistence_with_shared_preferences_app/main_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GenerateNumberController(),
      child: const MainApp(),
    ),
  );
}
