import 'package:flutter_desafio_2/enums/moedas_enum.dart';

class CotacaoModel {
  final MoedasEnum moedaBase;
  final MoedasEnum moedaCotada;
  final double valorCompra;

  CotacaoModel({
    required this.moedaBase,
    required this.moedaCotada,
    required this.valorCompra,
  });

  factory CotacaoModel.toMap(json) {
    return CotacaoModel(
      moedaBase: moedas.parse(json['codein']),
      moedaCotada: moedas.parse(json['code']),
      valorCompra: double.parse(json['bid']),
    );
  }

  @override
  String toString() =>
      'CotacaoModel(moedaBase: $moedaBase, moedaCotada: $moedaCotada, valorCompra: $valorCompra)';
}
