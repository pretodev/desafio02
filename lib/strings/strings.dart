import 'package:flutter_desafio_2/enums/moedas_enum.dart';

class Strings {
  static const headerTitle = [
    'Moeda base',
    'Cotação',
    'Resultado',
  ];

  static const headerSubtitle = [
    'Selecione uma moeda base para as conversões',
    'Selecione as moedas a serem cotadas em Dólar Americano',
    'Confira os valores de compra referentes ao Dólar Americano',
  ];

  static String parseMoedasEnum(MoedasEnum? moeda) {
    switch (moeda) {
      case MoedasEnum.BRL:
        return 'Real';
      case MoedasEnum.USD:
        return 'Dólar Americano';
      case MoedasEnum.CAD:
        return 'Dólar Canadense';
      case MoedasEnum.JPY:
        return 'Iene Japonês';
      case MoedasEnum.GBP:
        return 'Libra Esterlina';
      default:
        return '';
    }
  }
}
