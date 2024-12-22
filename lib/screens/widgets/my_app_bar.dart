import 'package:flutter/material.dart';

import '../../constant.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/icons/menu.png',
              height: 30,
              color: Colors.white,
            ),
            Image.asset(
              'assets/icons/puma.png',
              height: 50,
              color: primaryColor,
            ),
            Image.asset(
              'assets/icons/shopping-bag.png',
              height: 30,
              color: Colors.white,
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
