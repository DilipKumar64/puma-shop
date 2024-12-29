import 'package:flutter/material.dart';
import 'package:puma_shop/screens/widgets/shoe_color_indicator.dart';

class ShoeColorsWidget extends StatelessWidget {
  const ShoeColorsWidget({super.key, required this.colors, required this.size});

  final List<Map<String, dynamic>> colors;
  final double size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Map<String, dynamic> color = colors[index];
          return ShoeColorIndicator(
            color2: Color(color['color2']),
            color1: Color(color['color1']),
            size: size,
          );
        },
      ),
    );
  }
}
