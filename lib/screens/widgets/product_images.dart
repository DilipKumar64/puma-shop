import 'package:flutter/material.dart';
import 'package:puma_shop/constant.dart';

class ProductImages extends StatelessWidget {
  const ProductImages(
      {super.key, required this.mainImage, required this.subImages});

  final String mainImage;
  final List<String> subImages;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.center,
          height: 220,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: secondryColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Image.asset(mainImage),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 60,
          child: ListView.builder(
            itemCount: subImages.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 8),
                width: 80,
                decoration: BoxDecoration(
                    color: secondryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset(
                  subImages[index],
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
