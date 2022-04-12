import 'package:flutter/material.dart';
import 'package:flutter_desafio_2/cubit/app_cubit.dart';
import 'package:flutter_desafio_2/cubit/app_state.dart';
import 'package:flutter_desafio_2/enums/moedas_enum.dart';
import 'package:flutter_desafio_2/widgets/moeda_card.dart';
import 'package:flutter_desafio_2/widgets/page_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../strings/strings.dart';
import '../theme/colors.dart';

class BasePage extends StatelessWidget {
  final VoidCallback onNextPage;

  const BasePage({Key? key, required this.onNextPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const moedas = MoedasEnum.values;
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return PageContent(
          title: Strings.headerTitle[0],
          subtitle: const Text(
            'Selecione uma moeda base para as conversões',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.text1,
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          content: ListView.builder(
            itemCount: moedas.length,
            itemBuilder: (context, index) {
              final moeda = moedas[index];
              return MoedaCard(
                moeda: moeda,
                selected: moeda == state.moedaBase,
                onClicked: () async {
                  context.read<AppCubit>().setMoedaBase(moeda);
                  await Future.delayed(const Duration(milliseconds: 500));
                  onNextPage();
                },
              );
            },
          ),
        );
      },
    );
  }
}
