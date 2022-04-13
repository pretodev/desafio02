import 'package:flutter/material.dart';
import 'package:flutter_desafio_2/main.dart';
import 'package:flutter_desafio_2/theme/colors.dart';

import 'components/splash_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

const _duration = Duration(seconds: 5);

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: _duration,
    )..addListener(_startListener);

    _scaleAnimation = CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _animationController,
    );

    _animationController.forward();
  }

  void _startListener() {
    if (_animationController.isCompleted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => HomeScreen()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) {
          return SplashWidget(
            opacity: _scaleAnimation,
            width: _scaleAnimation.value * 500,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
