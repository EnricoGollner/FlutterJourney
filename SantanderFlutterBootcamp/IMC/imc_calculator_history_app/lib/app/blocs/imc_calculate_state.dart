import 'package:imc_calculator_history_app/app/models/person_imc.dart';

abstract class IMCCalculateState {
  final List<PersonIMC> iMCsList;

  IMCCalculateState({required this.iMCsList});
}

class IMCCalculateInitialState extends IMCCalculateState {
  IMCCalculateInitialState({super.iMCsList = const []});
}

class IMCCalculateLoadingState extends IMCCalculateState {
  IMCCalculateLoadingState({required super.iMCsList});
}

class IMCCalculateSuccessState extends IMCCalculateState {
  final String? classification;
  final double? lastIMCCalculated;

  IMCCalculateSuccessState({required super.iMCsList, this.classification, this.lastIMCCalculated});
}

class IMCCalculateFailureState extends IMCCalculateState {
  final String message;

  IMCCalculateFailureState({required this.message, required List<PersonIMC> iMCsList}) : super(iMCsList: iMCsList);
}
