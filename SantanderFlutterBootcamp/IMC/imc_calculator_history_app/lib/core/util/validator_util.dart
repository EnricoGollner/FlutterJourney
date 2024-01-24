class Validator {
  static String? isRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'O preenchimento deste campo é obrigatório';
    }
    return null;
  }
}