import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/app_cubit.dart';
import '../cubit/app_state.dart';
import '../enums/moedas_enum.dart';
import '../strings/strings.dart';
import '../theme/colors.dart';
import '../widgets/moeda_card.dart';
import '../widgets/page_content.dart';

class CotadasPage extends StatefulWidget {
  final VoidCallback onNextPage;

  const CotadasPage({
    Key? key,
    required this.onNextPage,
  }) : super(key: key);

  @override
  State<CotadasPage> createState() => _CotadasPageState();
}

class _CotadasPageState extends State<CotadasPage> {
  List<MoedasEnum> moedasSelecionadas = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state.status == AppStatus.cotacoesCarregadas) {
          return widget.onNextPage();
        }

        if (state.status == AppStatus.cotacoesErro) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Ocorreu um com essas moedas'),
          ));
        }
      },
      builder: (context, state) {
        final moedas = MoedasEnum.values
            .where((moeda) => moeda != state.moedaBase)
            .toList();
        return PageContent(
          title: Strings.headerTitle[1],
          subtitle: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(
                color: AppColors.text1,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
              children: [
                const TextSpan(text: 'Selecione as moedas a serem cotadas em '),
                TextSpan(
                  text: Strings.parseMoedasEnum(state.moedaBase),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          actions: [
            Visibility(
              visible: state.status != AppStatus.cotacoesCarregando,
              child: ElevatedButton(
                child: const Text('Próximo'),
                onPressed: () {
                  context.read<AppCubit>().loadCotacaoes(moedasSelecionadas);
                },
              ),
              replacement: const ElevatedButton(
                child: Text('Carregando'),
                onPressed: null,
              ),
            ),
          ],
          content: ListView.builder(
            itemCount: moedas.length,
            itemBuilder: (context, index) {
              final moeda = moedas[index];
              return MoedaCard(
                moeda: moeda,
                selected: moedasSelecionadas.contains(moeda),
                onClicked: () {
                  setState(() {
                    if (moedasSelecionadas.contains(moeda)) {
                      moedasSelecionadas.remove(moeda);
                    } else {
                      moedasSelecionadas.add(moeda);
                    }
                  });
                },
              );
            },
          ),
        );
      },
    );
  }
}
