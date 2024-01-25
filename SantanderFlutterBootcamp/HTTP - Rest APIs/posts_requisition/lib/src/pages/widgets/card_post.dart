import 'package:flutter/material.dart';
import 'package:posts_requisition/src/core/theme/fonts.dart';

class CardPost extends StatelessWidget {
  final String title;
  final String body;

  const CardPost({
    super.key, required this.title, required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: labelStyle),
      subtitle: Text(body),
    );
  }

  
}