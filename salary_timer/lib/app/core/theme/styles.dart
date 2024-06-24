import 'package:flutter/material.dart';
import 'package:salary_timer/app/core/theme/colors.dart';

class Styles {
  static ThemeData get material3Theme => ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: backgroundColor
    ),
  );
}