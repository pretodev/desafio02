import 'package:flutter/material.dart';

import '../theme/colors.dart';

class PageContent extends StatelessWidget {
  final String title;
  final Widget subtitle;
  final Widget content;
  final List<Widget> actions;

  const PageContent({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.content,
    this.actions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32.0,
        vertical: 15.0,
      ),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          subtitle,
          const SizedBox(height: 10),
          Expanded(
            child: content,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: actions,
          ),
          const SizedBox(
            height: 60.0,
          )
        ],
      ),
    );
  }
}
