import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imc_calculator_history_app/app/controllers/imc_calculate_controller.dart';
import 'package:imc_calculator_history_app/app/pages/widgets/custom_card_imc.dart';
import 'package:imc_calculator_history_app/app/pages/widgets/custom_text_field.dart';
import 'package:imc_calculator_history_app/core/util/validator_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _weightTextController = TextEditingController();
  final _heightTextController = TextEditingController();

  late IMCCalculateController _controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _controller = IMCCalculateController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text("IMC Calculator"), centerTitle: true),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              CustomTextField(
                controller: _weightTextController,
                title: 'Weight',
                hintText: 'Weight (kg)',
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validatorFunction: Validator.isRequired,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _heightTextController,
                title: 'Height',
                hintText: 'Height (cm)',
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validatorFunction: Validator.isRequired,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await _controller.calculateIMC(
                      weight: double.parse(_weightTextController.text),
                      height: double.parse(_heightTextController.text),
                    );
                  }
                },
                child: const Text("Calcular"),
              ),
          
              
            ],
          ),
        ),
      ),
    );
  }
}
