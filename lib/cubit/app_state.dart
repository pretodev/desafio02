import 'package:flutter_desafio_2/enums/moedas_enum.dart';
import 'package:flutter_desafio_2/models/cotacao_model.dart';

enum AppStatus {
  definindoDados,
  cotacoesCarregando,
  cotacoesCarregadas,
  cotacoesErro,
}

class AppState {
  final MoedasEnum? moedaBase;
  final List<CotacaoModel> cotacoes;
  final AppStatus status;

  AppState({
    this.moedaBase,
    this.cotacoes = const [],
    this.status = AppStatus.definindoDados,
  });

  AppState copyWith({
    MoedasEnum? moedaBase,
    List<CotacaoModel>? cotacoes,
    AppStatus? status,
  }) {
    return AppState(
      moedaBase: moedaBase ?? this.moedaBase,
      cotacoes: cotacoes ?? this.cotacoes,
      status: status ?? this.status,
    );
  }
}
