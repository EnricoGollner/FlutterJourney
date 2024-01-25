import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imc_calculator_history_app/core/theme/fonts.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final IconData? prefixIcon;
  final String? Function(String?)? validatorFunction;
  final Function(String _)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
    this.focusNode,
    required this.keyboardType,
    this.prefixIcon,
    this.validatorFunction,
    this.onFieldSubmitted,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 5),
          child: Text(
            title,
            style: labelStyle,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          controller: controller,
          focusNode: focusNode,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hintText,
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          ),
          validator: validatorFunction,
          onFieldSubmitted: onFieldSubmitted,
          inputFormatters: inputFormatters,
          
        ),
      ],
    );
  }
}
