import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? prefix;
  final String? label;
  final void Function(String? value)? onChanged;
  final TextInputType? keyboardType;
  final int? maxLines;
  final String? Function(String? text)? validatorFunction;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    required this.controller,
    this.prefix,
    this.label,
    this.onChanged,
    this.inputFormatters,
    this.keyboardType,
    this.validatorFunction, this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (_) => FocusManager.instance.primaryFocus!.unfocus(),
      decoration: InputDecoration(
        label: Text(label ?? ''),
        prefix: prefix != null ? Text(prefix!) : null,
      ),
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      validator: validatorFunction,
    );
  }
}
