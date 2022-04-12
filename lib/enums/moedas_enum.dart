enum MoedasEnum {
  BRL,
  USD,
  CAD,
  JPY,
  GBP,
}

class moedas {
  static MoedasEnum parse(String data) {
    switch (data) {
      case 'BRL':
        return MoedasEnum.BRL;
      case 'USD':
        return MoedasEnum.USD;
      case 'CAD':
        return MoedasEnum.CAD;
      case 'JPY':
        return MoedasEnum.JPY;
      case 'GBP':
        return MoedasEnum.GBP;
    }
    throw Exception('Moeda $data nao existe no sistema');
  }
}
