import 'package:data_visualization_app/main_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    const AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.green,
        systemNavigationBarColor: Colors.green,
        systemNavigationBarDividerColor: Colors.green,
      ),
      child: MainApp(),
    ),
  );
}
