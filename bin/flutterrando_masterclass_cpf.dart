import 'dart:io';

void main() {
  menu();
}

menu() {
  stdout.writeln("\nQual o CPF a ser verificado se é valido?\n ");
  String cpf = stdin.readLineSync()!;
  cpf = cpf.replaceAll(RegExp(r"\D"), "");
  if (cpf.length != 11) {
    print("\x1B[2J\x1B[0;0H");
    print('Quantidade de números invalida\n');
    menu();
  } else {
    CpfValidator().isCpfValidate(cpf);
    menu();
  }
}

class CpfValidator {
  bool firstNumberValidator(String cpf) {
    int iter = 2;
    List<int> output = [];
    int somatoria = 0;
    double resto = 0;
    for (int i = 9; i >= 1; i--) {
      output.add(int.parse(cpf[i - 1]) * iter);
      iter++;
    }
    for (int i = 0; i < output.length; i++) {
      somatoria = somatoria + output[i];
    }
    resto = somatoria % 11;
    if (resto < 2 && int.parse(cpf[9]) == 0) {
      return true;
    } else if (resto >= 2 && (int.parse(cpf[9]) == (11 - resto))) {
      return true;
    } else {
      return false;
    }
  }

  bool secondNumberValidator(String cpf) {
    int iter = 2;
    List<int> output = [];
    int somatoria = 0;
    double resto = 0;
    for (int i = 10; i >= 1; i--) {
      output.add(int.parse(cpf[i - 1]) * iter);
      iter++;
    }
    for (int i = 0; i < output.length; i++) {
      somatoria = somatoria + output[i];
    }
    resto = somatoria % 11;
    if (resto < 2 && int.parse(cpf[10]) == 0) {
      return true;
    } else if (resto >= 2 && (int.parse(cpf[10]) == (11 - resto))) {
      return true;
    } else {
      return false;
    }
  }

  isCpfValidate(String cpf) {
    if (firstNumberValidator(cpf)) {
      print('O primeiro digito verificador é valido\n');
    } else {
      print('O primeiro digito verificador não é valido\n');
    }
    if (secondNumberValidator(cpf)) {
      print('O segundo digito verificador é valido\n');
    } else {
      print('O segundo digito verificador não é valido\n');
    }
    if (firstNumberValidator(cpf) && secondNumberValidator(cpf)) {
      print('Logo este CPF é valido');
    } else {
      print('Logo este CPF não é valido');
    }
  }
}
