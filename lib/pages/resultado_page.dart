import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/app_cubit.dart';
import '../cubit/app_state.dart';
import '../strings/strings.dart';
import '../theme/colors.dart';
import '../widgets/moeda_card.dart';
import '../widgets/page_content.dart';

class ResultadoPage extends StatelessWidget {
  final VoidCallback onFinish;

  const ResultadoPage({
    Key? key,
    required this.onFinish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return PageContent(
          title: Strings.headerTitle[2],
          subtitle: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(
                color: AppColors.text1,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
              children: [
                const TextSpan(text: 'Confira os valores de Dólar Americano '),
                const TextSpan(
                  text: 'compra',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' referentes ao '),
                TextSpan(
                  text: Strings.parseMoedasEnum(state.moedaBase),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              child: const Text('Concluir'),
              onPressed: () {
                context.read<AppCubit>().reset();
                onFinish();
              },
            ),
          ],
          content: ListView.builder(
            itemCount: state.cotacoes.length,
            itemBuilder: (context, index) {
              final cotacao = state.cotacoes[index];
              return MoedaCard(
                moeda: cotacao.moedaCotada,
                valor: cotacao.valorCompra,
              );
            },
          ),
        );
      },
    );
  }
}
