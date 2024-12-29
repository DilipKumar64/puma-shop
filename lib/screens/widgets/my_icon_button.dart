import 'package:flutter/material.dart';

import '../../constant.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    super.key,
    required this.iconPath,
  });
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: secondryColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Image.asset(
        iconPath,
        color: Colors.white,
      ),
    );
  }
}
