import 'package:flutter/material.dart';

import '../../constant.dart';

class ColorAndPriceRow extends StatelessWidget {
  const ColorAndPriceRow({super.key, required this.price});
  final String price;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "COLOR",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const Spacer(),
            const Text(
              '₹',
              style: TextStyle(color: primaryColor, fontSize: 27),
            ),
            Text(
              price,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ],
    );
  }
}
