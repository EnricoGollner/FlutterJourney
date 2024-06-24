import 'package:flutter/material.dart';
import 'package:salary_timer/app/controllers/main_controller.dart';
import 'package:salary_timer/app/core/theme/fonts.dart';

class CustomSalaryDay extends StatelessWidget {
  final AppState state;
  final Widget loadedWidget;

  const CustomSalaryDay({super.key, required this.state, required this.loadedWidget});

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case AppState.loading:
        return Text('Loading...', style: contentStyle);
      case AppState.success:
        return loadedWidget;
      default:
        return Text('Error', style: contentStyle,);
    }
  }
}