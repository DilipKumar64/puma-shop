import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class ProductNameAndRating extends StatelessWidget {
  const ProductNameAndRating({super.key, required this.productName});
  final String productName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          productName,
          style: const TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
        ),
        const Spacer(),
        RatingBar(
          filledColor: primaryColor,
          emptyColor: const Color(0xff8d8d8c),
          size: 20,
          filledIcon: Icons.star,
          emptyIcon: Icons.star,
          onRatingChanged: (value) => debugPrint('$value'),
          initialRating: 3,
          maxRating: 5,
        ),
        const Text(
          '(',
          style: TextStyle(color: primaryColor, fontSize: 12),
        ),
        const Text(
          '39',
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        const Text(
          ')',
          style: TextStyle(color: primaryColor, fontSize: 12),
        ),
      ],
    );
  }
}
