class InputValidators {
  // Valida email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira um email';
    }
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Por favor, insira um email válido';
    }
    return null;
  }

  // Valida senha
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira uma senha';
    }
    if (value.length < 6) {
      return 'A senha deve ter no mínimo 6 caracteres';
    }
    return null;
  }

  // Valida número de telefone
  static String? validatePhoneNumber(String? value) {
    // Remove espaços e caracteres não numéricos
    final cleanedValue = value?.replaceAll(RegExp(r'\D'), '');
    
    if (cleanedValue == null || cleanedValue.isEmpty) {
      return 'Por favor, insira um número de telefone';
    }
    
    // Verifica se o número tem 10 ou 11 dígitos (DDD + 9 dígitos para celulares)
    if (cleanedValue.length < 10 || cleanedValue.length > 11) {
      return 'Por favor, insira um número de telefone válido';
    }

    // Se a validação passar, pode retornar null
    return null;
  }
}
