import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_desafio_2/cubit/app_state.dart';
import 'package:flutter_desafio_2/enums/moedas_enum.dart';
import 'package:flutter_desafio_2/repositories/cotacao_repository.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());

  final repository = CotacaoRepository();

  void setMoedaBase(MoedasEnum moeda) {
    emit(state.copyWith(
      moedaBase: moeda,
      status: AppStatus.definindoDados,
    ));
  }

  void loadCotacaoes(List<MoedasEnum> moedasSelecionadas) async {
    try {
      emit(state.copyWith(status: AppStatus.cotacoesCarregando));
      final cotacoes = await repository.getCotacoes(
        base: state.moedaBase!,
        cotadas: moedasSelecionadas,
      );
      emit(state.copyWith(
        cotacoes: cotacoes,
        status: AppStatus.cotacoesCarregadas,
      ));
    } catch (error) {
      emit(state.copyWith(status: AppStatus.cotacoesErro));
    }
  }

  void reset() {
    emit(AppState());
  }
}
