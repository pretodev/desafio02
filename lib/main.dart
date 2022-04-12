import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_desafio_2/cubit/app_cubit.dart';
import 'package:flutter_desafio_2/enums/moedas_enum.dart';
import 'package:flutter_desafio_2/navigator/app_navigator.dart';
import 'package:flutter_desafio_2/pages/base_page.dart';
import 'package:flutter_desafio_2/pages/cotadas_page.dart';
import 'package:flutter_desafio_2/pages/resultado_page.dart';
import 'package:flutter_desafio_2/repositories/cotacao_repository.dart';
import 'package:flutter_desafio_2/theme/colors.dart';

void main() async {
  final result = await CotacaoRepository().getCotacoes(
    base: MoedasEnum.BRL,
    cotadas: [
      MoedasEnum.JPY,
      MoedasEnum.USD,
    ],
  );
  print(result);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void navigateTo(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context) => AppCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              minimumSize: const Size(163.0, 43.0),
              elevation: 0,
              textStyle: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: 0.75,
              ),
            ),
          ),
        ),
        home: AppNavigator(
          pageController: pageController,
          pages: [
            BasePage(
              onNextPage: () => navigateTo(1),
            ),
            CotadasPage(
              onNextPage: () => navigateTo(2),
            ),
            ResultadoPage(
              onFinish: () => navigateTo(0),
            ),
          ],
        ),
      ),
    );
  }
}
