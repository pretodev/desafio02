import 'package:flutter/material.dart';
import 'package:flutter_desafio_2/theme/colors.dart';

class AppNavigator extends StatefulWidget {
  final List<Widget> pages;
  final PageController pageController;

  const AppNavigator({
    Key? key,
    required this.pages,
    required this.pageController,
  }) : super(key: key);

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator>
    with TickerProviderStateMixin {
  late TabController tab;

  @override
  void initState() {
    super.initState();
    tab = TabController(length: 3, vsync: this);
    widget.pageController.addListener(() {
      tab.animateTo(widget.pageController.page!.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: widget.pageController,
              children: widget.pages,
            ),
            TabPageSelector(
              controller: tab,
              color: AppColors.circleBg,
              selectedColor: AppColors.primary,
              indicatorSize: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}
