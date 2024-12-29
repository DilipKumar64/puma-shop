import 'package:flutter/material.dart';

import '../../constant.dart';

class ShoeColorIndicator extends StatelessWidget {
  const ShoeColorIndicator({
    super.key,
    required this.color1,
    required this.color2,
    required this.size,
  });
  final Color color1;
  final Color color2;
  final double size;
  @override
  Widget build(BuildContext context) {
    double fillPercent = 56.23;
    double fillStop = (100 - fillPercent) / 100;
    List<Color> gradient = [color1, color1, color2, color2];
    List<double> stops = [0, fillStop, fillStop, 1];
    return Container(
      margin: const EdgeInsets.only(right: 5),
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: primaryColor, width: 2),
        gradient: LinearGradient(
          colors: gradient,
          stops: stops,
          end: Alignment.bottomLeft,
          begin: Alignment.topRight,
        ),
      ),
    );
  }
}
