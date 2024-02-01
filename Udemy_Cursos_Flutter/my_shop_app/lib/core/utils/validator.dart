class Validator {
  static String? isRequired(String? text) {
    if (text == null || text.isEmpty) {
      return 'Required Field';
    }
    
    return null;
  }

  static String? isRequiredAndMinLength({required String? text, int minLength = 10}) {
    if (text == null || text.isEmpty) {
      return 'Required Field';
    } else if (text.length < minLength) {
      return 'Minimum length of $minLength characters';
    }
    
    return null;
  }
}