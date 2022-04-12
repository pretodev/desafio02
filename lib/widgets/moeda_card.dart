import 'package:flutter/material.dart';

import 'package:flutter_desafio_2/enums/moedas_enum.dart';
import 'package:flutter_desafio_2/strings/strings.dart';
import 'package:flutter_desafio_2/theme/colors.dart';

class MoedaCard extends StatelessWidget {
  final MoedasEnum moeda;
  final bool selected;
  final VoidCallback? onClicked;
  final double? valor;

  const MoedaCard({
    Key? key,
    required this.moeda,
    this.selected = false,
    this.onClicked,
    this.valor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget valorWidget = const SizedBox();
    if (valor != null) {
      final color = valor! < 1
          ? AppColors.good
          : valor! < 5
              ? AppColors.warning
              : AppColors.bad;
      valorWidget = Text(
        valor!.toStringAsFixed(2),
        style: TextStyle(
          color: color,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: InkWell(
        onTap: onClicked,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          height: 74.0,
          decoration: BoxDecoration(
            color: AppColors.itemBg,
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            border: selected
                ? Border.all(width: 3, color: AppColors.primary)
                : null,
          ),
          child: Row(
            children: [
              Icon(
                Icons.attach_money,
                size: 30,
                color: selected ? AppColors.primary : AppColors.text2,
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Text(
                  Strings.parseMoedasEnum(moeda),
                  style: TextStyle(
                    color: selected ? AppColors.primary : AppColors.text2,
                    fontSize: 18.0,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w300,
                  ),
                ),
              ),
              valorWidget
            ],
          ),
        ),
      ),
    );
  }
}
