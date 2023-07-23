import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyTextForm extends StatelessWidget {
  const CurrencyTextForm({
    super.key,
    required labelText,
    required prefixCurrency,
    required controller,
    required Function(String) valueChanged,
  })  : _label = labelText,
        _prefixCurrency = prefixCurrency,
        _controller = controller,
        _valueChanged = valueChanged;

  final String _label;
  final String _prefixCurrency;
  final TextEditingController _controller;
  final Function(String) _valueChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: _label,
        labelStyle: const TextStyle(color: Colors.amber, fontSize: 20),
        border: const OutlineInputBorder(),
        prefixText: _prefixCurrency,
        prefixStyle: const TextStyle(color: Colors.amber, fontSize: 20),
      ),
      style: const TextStyle(
        color: Colors.amber,
        fontSize: 20,
      ),
      onChanged: _valueChanged,
    );
  }
}
