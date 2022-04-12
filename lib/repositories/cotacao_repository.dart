import 'dart:convert';

import 'package:flutter_desafio_2/enums/moedas_enum.dart';
import 'package:flutter_desafio_2/models/cotacao_model.dart';
import 'package:http/http.dart' as http;

class CotacaoRepository {
  Future<List<CotacaoModel>> getCotacoes({
    required MoedasEnum base,
    required List<MoedasEnum> cotadas,
  }) async {
    final params =
        cotadas.map((cotada) => '${cotada.name}-${base.name}').join(',');
    final url = 'https://economia.awesomeapi.com.br/last/$params';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return json.values.map(CotacaoModel.toMap).toList();
  }
}
