import 'package:flutter/material.dart';
import 'package:imc_calculator_history_app/app/blocs/imc_bloc.dart';
import 'package:imc_calculator_history_app/app/blocs/imc_calculate_event.dart';
import 'package:imc_calculator_history_app/app/blocs/imc_calculate_state.dart';
import 'package:imc_calculator_history_app/app/models/person_imc.dart';
import 'package:imc_calculator_history_app/app/pages/widgets/custom_card_imc.dart';
import 'package:imc_calculator_history_app/app/pages/widgets/custom_text_field.dart';
import 'package:imc_calculator_history_app/core/util/decimal_text_input_formatter.dart';
import 'package:imc_calculator_history_app/core/util/formatters.dart';
import 'package:imc_calculator_history_app/core/util/validator_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late IMCCalculateBloc _bloc;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _weightTextController = TextEditingController();
  final TextEditingController _heightTextController = TextEditingController();

  final FocusNode _heightFocusNode = FocusNode();

  @override
  void initState() {
    _bloc = IMCCalculateBloc();
    _bloc.input.add(IMCCalculateLoadEvent());
    super.initState();
  }

  @override
  void dispose() {
    _bloc.input.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("IMC Calculator"), centerTitle: true),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _weightTextController,
                  title: 'Weight (kg)',
                  hintText: 'Weight (kg)',
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  onFieldSubmitted: (_) => _heightFocusNode.requestFocus(),
                  validatorFunction: Validator.isRequired,
                  inputFormatters: [
                    DecimalTextInputFormatter.signal,
                    DecimalTextInputFormatter(decimalRange: 2),
                  ],
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _heightTextController,
                  focusNode: _heightFocusNode,
                  title: 'Height (cm)',
                  hintText: 'Height (cm)',
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  validatorFunction: Validator.isRequired,
                  inputFormatters: [
                    DecimalTextInputFormatter.signal,
                    DecimalTextInputFormatter(decimalRange: 2),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _calculateIMC();
                    }
                  },
                  child: const Text("Calcular"),
                ),
                const SizedBox(height: 17),
            
                StreamBuilder(
                  stream: _bloc.stream,
                  builder: (context, AsyncSnapshot<IMCCalculateState> snapshotState) {
                    final List<PersonIMC> iMCsList = snapshotState.data?.iMCsList ?? [];
        
                    if (snapshotState.data is IMCCalculateLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
        
                    return Column(
                      children: [
                        Text(snapshotState.data is IMCCalculateSuccessState ? 'Classificação: ${(snapshotState.data as IMCCalculateSuccessState).classificacao}' : ''),
                        Text(_showIMC(state: snapshotState.data ?? IMCCalculateInitialState())),
                        
                        SizedBox(
                          height: 200,
                            child: ListView.builder(
                              itemCount: iMCsList.length,
                              itemBuilder: (context, index) {
                                final PersonIMC personIMC = iMCsList[index];
                        
                                return CustomCardIMC(
                                  imc: personIMC.imc,
                                  weight: personIMC.weight,
                                  date: personIMC.date,
                                  deleteFunction: () => _bloc.input.add(IMCCalculateDeleteEvent(id: iMCsList[index].id!))
                                );
                              },
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _calculateIMC() {
    final double weight = Formatters.stringToDouble(value: _weightTextController.text);
    final double height = Formatters.stringToDouble(value: _heightTextController.text);

    _bloc.input.add(IMCCalculateAddIMCEvent(height, weight));

    _weightTextController.clear();
    _heightTextController.clear();
  }

  String _showIMC({required IMCCalculateState state}) {
    if (state is IMCCalculateSuccessState && state.lastIMCCalculated != null) {
      return 'IMC: ${Formatters.numberToDecimal(state.lastIMCCalculated!)}';
    }

    return '';
  }
}
