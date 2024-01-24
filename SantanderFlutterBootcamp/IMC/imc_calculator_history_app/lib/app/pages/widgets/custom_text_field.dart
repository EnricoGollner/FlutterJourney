import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final String? Function(String?)? validatorFunction;
  final Function(String _)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField(
      {super.key,
      required this.title,
      required this.hintText,
      required this.keyboardType,
      this.controller,
      this.prefixIcon,
      this.validatorFunction,
      this.onFieldSubmitted,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 5),
          child: Text(
            title,
            style: GoogleFonts.montserrat(
                fontSize: 13.0, fontWeight: FontWeight.w300),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
