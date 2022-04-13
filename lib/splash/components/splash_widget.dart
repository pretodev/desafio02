import 'package:flutter/material.dart';

class SplashWidget extends StatelessWidget {
  final Animation<double>? opacity;

  final double? width;
  final double? scale;
  final double? height;

  const SplashWidget({
    Key? key,
    this.width,
    this.scale,
    this.height,
    this.opacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/logo.png',
        width: width,
        opacity: opacity,
      ),
    );
  }
}
